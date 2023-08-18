module DOM.Indexed.Self where

import Prelude
import Prim hiding (Type)

import DOM.Common (declHandler, selfKey, typeAttributed, typeEvented,nominal, typeIndexedAt)
import DOM.TypeStub (TypeStub(..), constructArg, constructIndex, handler, handlerImports)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..))
import PureScript.CST.Types (Type, ClassFundep(..), Declaration, ImportDecl)
import Tidy.Codegen (binaryOp, declClass, declImport, declImportAs, declInstance, declSignature, declValue, exprIdent, exprOp, importOp, importType, importValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeString, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)


imports :: Partial => Array TypeStub -> Array ( ImportDecl Void )
imports es =
    Array.concat
        [ identity 
            [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
            , declImportAs "FRP.Event" [] "FRP.Event"
            , declImport "Type.Proxy" [ importType "Proxy" ]
            ]
        , handlerImports $ Array.cons rawSelf es
        ]

generate :: Partial => Array TypeStub -> Array ( Declaration Void )
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
            $ typeForall [ typeVar "r" ]
            $ typeArrow [ typeEvented $ constructArg rawSelf ]
            $ typeEvented $ typeAttributed $ typeVar "r"
        , declHandler "self" selfKey $ handler $ rawSelf

        , declSignature "self_"
            $ typeForall [ typeVar "r" ]
            $ typeArrow [ constructArg rawSelf ]
            $ typeEvented $ typeAttributed $ typeVar "r"
        , declValue "self_" [] $ exprOp ( exprIdent "self" ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ]
        
        , declSignature "selfT"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ typeEvented $ selfHandler $ typeVar "e" ]
            $ typeEvented $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declHandler "selfT" selfKey $ handler rawSelf

        , declSignature "selfT_"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ selfHandler $ typeVar "e" ]
            $ typeEvented $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declValue "selfT_" [] $ exprOp ( exprIdent "selfT" ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ]

        ]
        $ bind es case _ of
            TypeEvent t mod  ->
                [ declInstance Nothing []
                    "IsSelf"
                    [ constructIndex $ TypeEvent t mod
                    , typeString t
                    ]
                    []
                ]

    where

    selfHandler :: Partial => Type Void -> Type Void
    selfHandler intf =
        typeArrow [ intf ] $ typeApp ( typeCtor "Effect.Effect" ) [ typeCtor "Data.Unit.Unit" ]

rawSelf :: TypeStub
rawSelf = 
    TypeEvent "Element" "Web.DOM.Element"