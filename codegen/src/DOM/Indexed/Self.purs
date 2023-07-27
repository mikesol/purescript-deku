module DOM.Indexed.Self where

import Prelude
import Prim hiding (Type)

import DOM.Common (TypeStub(..), declHandler, handler, selfKey, typeAttributed, typeEvented, typeImports)
import DOM.Indexed.Common (nominal, typeIndexedAt)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
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
            , declImportAs "Deku.DOM.Indexed.Index" [] "Index"
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
        
        , declSignature "self"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ typeEvented $ selfHandler $ typeVar "e" ]
            $ typeEvented $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declHandler "self" selfKey $ handler TypeSelfHandler

        , declSignature "self_"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ selfHandler $ typeVar "e" ]
            $ typeEvented $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declValue "self_" [] $ exprOp ( exprIdent "self" ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ]

        , declInstance Nothing [] "IsSelf"
            [ typeCtor ( "Web.Element" )
            , typeString "global"
            ]
            []
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
