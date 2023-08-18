module DOM.Indexed.Element where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor(..), Element, Interface, TagNS, typeArrayed, typeAttributed, typeEvented, typeNut, xhtmlNamespace, nominal)
import DOM.TypeStub (constructIndex, indexImports)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..), fromMaybe, maybe)
import Data.Set as Set
import Data.Tuple (snd)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import PureScript.CST.Types (ClassFundep(..), Declaration, Export, Expr, ImportDecl, Type)
import Safe.Coerce (coerce)
import Tidy.Codegen (declClass, declImport, declImportAs, declInstance, declSignature, declType, declValue, exportClass, exportType, exportValue, exprApp, exprArray, exprCtor, exprIdent, exprString, importType, importTypeAll, importValue, typeApp, typeArrow, typeCtor, typeRow, typeRowEmpty, typeString, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)

imports :: Partial => String -> Foreign.Object Interface -> Array ( ImportDecl Void )
imports baseMod interfaces = 
    Array.concat
        [ identity 
            [ declImportAs "FRP.Event" [] "FRP.Event"
            , declImport "Data.Maybe" [ importTypeAll "Maybe" ]
            , declImportAs "Deku.Attribute" [] "Deku.Attribute"
            
            , declImport "Deku.Control" [ importValue "elementify2" ]
            , declImport "Deku.Core" [ importType "Nut" ]
            , declImport "Type.Proxy" [ importType "Proxy" ]
            ]
        , indexImports ( bind ( Foreign.values interfaces ) \{ members } -> map snd members )
        , if Set.isEmpty missing then [] else pure
            $ declImport baseMod $ map importType $ Array.fromFoldable missing
        ]

    where

    missing =
        Set.difference required defined

    required =
        Set.fromFoldable $ bind ( Foreign.values interfaces ) ( coerce <<< _.bases )
    
    defined =
        Set.fromFoldable $ Foreign.keys interfaces

exports :: Partial => Foreign.Object Interface -> Array Element -> Array ( Export Void )
exports interfaces tags = do
    Array.concat
        [ pure $ exportClass "TagToDeku"
        , bind tags \{ ctor : Ctor tag } -> do
            let shortHand = tag <> "_"
            [ exportValue tag, exportValue shortHand ]
        , map exportType $ Foreign.keys interfaces
        ]

generate :: Partial => Foreign.Object Interface -> Array Element -> Array ( Declaration Void )
generate interfaces tags = do
    Array.concat
        [ pure $ declClass [] "TagToDeku"
            [ typeVarKinded "tag" $ typeCtor "Symbol" 
            , typeVarKinded "interface" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ]
            ]
            [ FundepDetermines ( NEA.singleton ( toName "tag" ) ) tokRightArrow ( NEA.singleton ( toName "interface" ) ) ]
            []

        -- interfaces
        , bind ( Foreign.values interfaces ) \{ ctor, name, bases, members } ->
            [ declType ctor [ typeVarKinded "r" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ] ]
                $ typeIndex ( coerce bases )
                -- add an additional property to identify the interface
                $ Array.cons ( nominal /\ ( typeApp ( typeCtor "Proxy" ) [ typeString name ] ) )
                $ map (\( index /\ t ) -> index /\ constructIndex t )
                $ Array.nub members
            ]

        -- elements
        , bind tags \{ ctor : Ctor ctor, tag, ns, interface } -> do
            let shortHand = ctor <> "_"
            [ declInstance Nothing [] "TagToDeku" [ typeString tag, typeApp ( typeCtor interface ) [ typeRowEmpty ] ] []
            , declSignature ctor
                $ typeArrow
                    [ typeArrayed $ typeEvented $ typeAttributed $ typeApp ( typeCtor interface ) [ typeRowEmpty ]
                    , typeApp ( typeCtor "Array" ) [ typeNut ]
                    ]
                    typeNut
            , declValue ctor [] $ exprApp ( exprIdent "elementify2" )
                [ exprNamespace ns
                , exprString tag
                ]

            , declSignature shortHand
                $ typeArrow
                    [ typeApp ( typeCtor "Array" ) [ typeNut ]
                    ]
                    typeNut
            , declValue shortHand [] $ exprApp ( exprIdent ctor )
                [ exprArray []
                ]
            ]
        ]

    where

    exprNamespace :: Partial => TagNS -> Expr Void
    exprNamespace ns =
         maybe
            ( exprCtor "Nothing" )
            ( exprApp ( exprCtor "Just" ) <<< pure <<< exprString )
            ( xhtmlNamespace ns )

typeIndex :: Partial => Array String -> Array ( Ctor /\ Type Void ) -> Type Void 
typeIndex bases members =
    typeRow members $ Just $ Array.foldl (\r n -> typeApp ( typeCtor n ) [ r ] ) ( typeVar "r" ) bases

-- | Constructs the set of reachable interfaces for the root defined by all elements.
crawlInterfaces :: Array Element -> Array Interface -> Foreign.Object Interface
crawlInterfaces elements all =
    Foreign.fromFoldable $ flip Array.mapMaybe all \intf ->
        if intf.name `Set.member` reachable then
            Just $ intf.name /\ intf

        else
            Nothing
            
    where

    reachable :: Set.Set String
    reachable = 
        go
            ( Foreign.fromFoldable $ map (\{ name, bases } -> name /\ coerce bases ) all )
            initial
            initial

    initial :: Set.Set String
    initial =
        Set.fromFoldable $ coerce <<< _.interface <$> elements

    go :: Foreign.Object ( Array String ) -> Set.Set String -> Set.Set String -> Set.Set String
    go _ seen next | Set.isEmpty next = seen
    go spec seen next = do
        let
            found :: Set.Set String
            found =
                Set.fromFoldable
                    $ Array.foldMap ( fromMaybe mempty <<< flip Foreign.lookup spec <<< coerce )
                    $ Set.toUnfoldable next

        go spec ( Set.union seen found ) ( Set.difference found seen )