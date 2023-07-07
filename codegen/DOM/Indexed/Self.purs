module DOM.Indexed.Self where

import Prelude
import Prim hiding (Type)

import DOM.Indexed.Common (declHandler, nominal)
import DOM.Indexed.Props (typeEvented)
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..))
import Data.Set (Set)
import Data.Set as Set
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Type, ClassFundep(..), Declaration, ImportDecl)
import Tidy.Codegen (binaryOp, declClass, declImport, declImportAs, declInstance, declSignature, declValue, exprCtor, exprIdent, exprOp, importOp, importType, importTypeAll, importValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeString, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)

imports :: Set String -> Array ( ImportDecl Void )
imports es =
    unsafePartial
        $ append
            [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImport "Data.Function" [ importOp "$"]
            , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
            , declImport "Data.Unit" [ importType "Unit" ]
            , declImport "Effect" [ importType "Effect" ]
            , declImport "Unsafe.Coerce" [ importValue "unsafeCoerce" ]
            , declImport "Deku.Attribute"
                [ importTypeAll "Cb"
                , importType "Attribute"
                , importValue "unsafeAttribute"
                , importValue "cb'"
                ]
            , declImport "Deku.DOM.Indexed" [ importType "Indexed" ]
            , declImport "FRP.Event" [ importType "Event" ]
            , declImport "Type.Proxy" [ importType "Proxy" ]
            ]
        $ flip map ( Set.toUnfoldable es ) case _ of
            "Element" ->
                declImportAs ( "Web.DOM.Element" ) [ importType "Element" ] "Web"

            e ->
                declImportAs ( "Web.HTML." <> e ) [ importType e ] "Web"

generates :: Set String -> Array ( Declaration Void )
generates es =
    unsafePartial $ append 
        [ declClass [] "IsSelf"
            [ typeVarKinded "element" $ typeCtor "Type"
            , typeVarKinded "name" $ typeCtor "Symbol" 
            ]
            [ FundepDetermines ( NEA.singleton ( toName "element") ) tokRightArrow ( NEA.singleton ( toName "name" ) )
            ]
            []
        
        , declSignature "self"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ typeApp ( typeCtor "Event" ) [ selfHandler $ typeVar "e" ] ]
            $ typeEvented nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declHandler "self" selfKey $
            exprOp ( exprIdent "cb'" )
                [ binaryOp "<<<" $ exprCtor "Cb"
                , binaryOp "<<<" $ exprIdent "unsafeCoerce" 
                ]

        , declSignature "self_"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ selfHandler $ typeVar "e" ]
            $ typeEvented nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declValue "self_" [] $ exprOp ( exprIdent "self" ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ]  
        ]
        $ flip map ( Set.toUnfoldable es ) \e ->
            declInstance Nothing []
                "IsSelf"
                [ typeCtor ( "Web." <> e )
                , typeString e
                ]
                []

    where

    selfHandler :: Partial => Type Void -> Type Void
    selfHandler intf =
        typeArrow [ intf ] $ typeApp ( typeCtor "Effect" ) [ typeCtor "Unit" ]

    selfKey :: String
    selfKey =
        "@self@"