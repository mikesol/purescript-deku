module DOM.Indexed.Self where

import Prelude
import Prim hiding (Type)

import Comment (documentDecl)
import DOM.Common (declHandler, nominal, selfKey, typeAttributed, typeFunked, typeIndexedAt)
import DOM.TypeStub (TypeStub(..), constructArg, constructIndex, handler, handlerImports)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Maybe (Maybe(..))
import PureScript.CST.Types (Type, ClassFundep(..), Declaration, ImportDecl)
import Tidy.Codegen (binaryOp, declClass, declImport, declImportAs, declInstance, declSignature, declValue, exprIdent, exprOp, importClass, importOp, importType, importValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeString, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)


imports :: Partial => Array TypeStub -> Array ( ImportDecl Void )
imports es =
    Array.concat
        [ identity 
            [ declImportAs "Control.Applicative" [ importValue "pure", importClass "Applicative" ] "Applicative"
            , declImport "Control.Category" [ importOp "<<<" ]
            , declImportAs "Data.Functor" [ importValue "map", importClass "Functor" ] "Functor"
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

        , documentDecl
            [ "Creates a special event where an Deku element can have its raw DOM element"
            , "injected into a closure. All bets are off type-safety wise. This is useful"
            , "when you need to manipulate the element itself, like for example attaching"
            , "properties to it, etc."
            ]
            $ declSignature "self"
            $ typeForall [ typeVar "r", typeVar "f" ]
            $ typeConstrained [ typeApp ( typeCtor "Functor.Functor" ) [ typeVar "f"  ] ]
            $ typeArrow [ typeFunked "f" $ constructArg rawSelf ]
            $ typeFunked "f" $ typeAttributed $ typeVar "r"
        , declHandler "self" selfKey $ handler $ rawSelf

        , documentDecl [ "Shorthand version of `self`" ]
            $ declSignature "self_"
            $ typeForall [ typeVar "r", typeVar "f" ]
            $ typeConstrained [ typeApp ( typeCtor "Applicative.Applicative" ) [ typeVar "f"  ] ]
            $ typeArrow [ constructArg rawSelf ]
            $ typeFunked "f" $ typeAttributed $ typeVar "r"
        , declValue "self_" [] $ exprOp ( exprIdent "self" ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ]
        
        , documentDecl 
            [ "A slightly less permissive version of `Self` that associates Deku Elements to"
            , "the primitive element definitions form `purescript-web`. For example, `A_` from `deku`"
            , "gets translated to `HTMLAnchorElement` from `purescript-web`, etc."
            ] 
            $ declSignature "selfT"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" ,typeVar "f" ]
            $ typeConstrained [ typeApp ( typeCtor "Functor.Functor" ) [ typeVar "f"  ] ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ typeFunked "f" $ selfHandler $ typeVar "e" ]
            $ typeFunked "f" $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
        , declHandler "selfT" selfKey $ handler rawSelf

        , documentDecl [ "Shorthand version of `selfT`" ]
            $ declSignature "selfT_"
            $ typeForall [ typeVar "name", typeVar "e", typeVar "r" , typeVar "f"]
            $ typeConstrained [ typeApp ( typeCtor "Applicative.Applicative" ) [ typeVar "f"  ] ]
            $ typeConstrained [ typeApp ( typeCtor "IsSelf" ) [ typeVar "e" , typeVar "name"  ] ]
            $ typeArrow [ selfHandler $ typeVar "e" ]
            $ typeFunked "f" $ typeAttributed $ typeIndexedAt nominal $ typeApp ( typeCtor "Proxy" ) [ typeVar "name" ]
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