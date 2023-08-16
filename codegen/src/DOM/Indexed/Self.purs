module DOM.Indexed.Self where

import Prelude
import Prim hiding (Type)

import DOM.Common (declHandler, selfKey, typeAttributed, typeEvented)
import DOM.Indexed.Common (nominal, typeIndexedAt)
import DOM.TypeStub (TypeStub(..), handler, typeImports)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..))
import PureScript.CST.Types (Type, ClassFundep(..), Declaration, ImportDecl)
import Tidy.Codegen (binaryOp, declClass, declImport, declImportAs, declInstance, declSignature, declValue, exprIdent, exprOp, importOp, importType, importValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeString, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)

imports :: Partial => Array String -> Array ( ImportDecl Void )
imports es =
    Array.concat
        [ identity 
            [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
            , declImportAs "FRP.Event" [] "FRP.Event"
            , declImport "Type.Proxy" [ importType "Proxy" ]
            , declImportAs ( "Web.DOM.Element" ) [ importType "Element" ] "Web"
            ]
        , bind es \e ->
            [ declImportAs ( "Web.HTML." <> e ) [ importType e ] "Web" ]
        , typeImports [ TypeSelfHandler ]
        ]

generate :: Partial => Array String -> Array ( Declaration Void )
generate es =
    append 
        [ declClass [] "IsSelf"
            [ typeVarKinded "element" $ typeCtor "Type"
            , typeVarKinded "name" $ typeCtor "Symbol" 
            ]
            [ FundepDetermines ( NEA.singleton ( toName "element") ) tokRightArrow ( NEA.singleton ( toName "name" ) )
            ]
            []

        , declSignature "_self"
            $ typeForall [ typeVar "r" ]
            $ typeArrow [ typeEvented $ selfHandler $ typeCtor "Web.Element" ]
            $ typeEvented $ typeAttributed $ typeVar "r"
        , declHandler "_self" selfKey $ handler TypeSelfHandler

        , declSignature "_self_"
            $ typeForall [ typeVar "r" ]
            $ typeArrow [ selfHandler $ typeCtor "Web.Element" ]
            $ typeEvented $ typeAttributed $ typeVar "r"
        , declValue "_self_" [] $ exprOp ( exprIdent "_self" ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ]
        
        , declSignature "_selfT"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ typeEvented $ selfHandler $ typeVar "e" ]
            $ typeEvented $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declHandler "_selfT" selfKey $ handler TypeSelfHandler

        , declSignature "_selfT_"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ selfHandler $ typeVar "e" ]
            $ typeEvented $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declValue "_selfT_" [] $ exprOp ( exprIdent "_selfT" ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ]

        ]
        $ bind es \e ->
            [ declInstance Nothing []
                "IsSelf"
                [ typeCtor ( "Web." <> e )
                , typeString e
                ]
                []
            ]

    where

    selfHandler :: Partial => Type Void -> Type Void
    selfHandler intf =
        typeArrow [ intf ] $ typeApp ( typeCtor "Effect.Effect" ) [ typeCtor "Data.Unit.Unit" ]
