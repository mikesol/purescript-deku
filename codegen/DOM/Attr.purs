module DOM.Attr where

import Prelude
import Prim hiding (Type)

import DOM.Common (TypeStub(..), construct, handler, typeAttributed, typeEvented, typeImports)
import DOM.Elt (Elt)
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Data.Set (Set)
import Data.Set as Set
import Data.Tuple (fst, snd)
import Data.Tuple.Nested (type (/\), (/\))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, ImportDecl, Proper(..), Type)
import Tidy.Codegen (binaryOp, binderWildcard, declData, declImport, declInstance, declType, exprApp, exprIdent, exprOp, exprRecord, exprSection, exprString, importType, instValue, typeApp, typeConstrained, typeCtor, typeForall, typeVar)

imports :: Set ( TypeStub /\ Elt ) -> Array ( ImportDecl Void )
imports typeAndElts = 
    unsafePartial $ Array.concat
        [ typeImports $ Array.cons TypeUnit $ Set.toUnfoldable $ Set.map fst typeAndElts
        , flip map ( Set.toUnfoldable $ Set.map snd typeAndElts ) \elt ->
            declImport elt.module [ importType elt.type ]
        ]

type Attr =
    { name :: String
    , srcName :: String
    , type :: String
    , module :: String
    }

generate :: Attr -> Set ( TypeStub /\ Elt ) -> Array ( Declaration Void )
generate { srcName, type : typeName } typeAndElts =
    unsafePartial $ Array.concat
        [ identity
            [ declData typeName [] []
            , declInstance Nothing [] typeAttr
                [ typeEverything, typeSelf, typeUnit ]
                [ instValue "attr" [ binderWildcard, binderWildcard ]
                    $ exprApp ( exprIdent "unsafeAttribute" )
                    [ exprRecord [ "key" /\ exprString srcName, "value" /\ exprIdent "Deku.Attribute.unset'" ] ]
                ]
            ]
        , if Set.isEmpty $ Set.filter ( fst >>> eq TypeEventHandler ) typeAndElts then [] else
            [ declType ( typeName <> "Effect" ) []
                $ typeForall [ typeVar "element" ]
                $ typeConstrained
                    [ typeApp ( typeCtor typeAttr ) 
                        [ typeVar "element"
                        , typeSelf
                        , typeApp ( typeCtor "Effect" ) [ typeCtor "Unit" ]
                        ]
                    ]
                $ typeEvented $ typeAttributed $ typeVar "element"
            ]
        , flip map ( Set.toUnfoldable typeAndElts ) \( attrType /\ elt ) ->
            declInstance Nothing [] typeAttr
                [ typeCtor elt.type, typeCtor elt.type, construct attrType ]
                [ instValue "attr" [ binderWildcard ]
                    $ exprOp ( exprIdent "unsafeAttribute" )
                    [ binaryOp "<<<" $ exprRecord [ "key" /\ exprString srcName, "value" /\ exprSection ]
                    , binaryOp "<<<" $ handler attrType
                    ]
                ]
        ]
    
    where

    typeSelf :: Partial => Type Void
    typeSelf =
        typeCtor typeName

typeAttr :: Proper
typeAttr =
    Proper "Deku.Attribute.Attr"

typeEverything :: Partial => Type Void
typeEverything =
    typeVar "everything"

typeUnit :: Partial => Type Void
typeUnit =
    typeCtor "Unit"