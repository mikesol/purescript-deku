module DOM.Attr where

import Prelude
import Prim hiding (Type)

import DOM.Common (Attribute, Element, TypeStub(..), attrType, construct, eltModule, eltType, handler, typeAttributed, typeEvented, typeImports)
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Data.Set (Set)
import Data.Set as Set
import Data.Tuple (fst, snd)
import Data.Tuple.Nested (type (/\), (/\))
import PureScript.CST.Types (Declaration, ImportDecl, Proper(..), Type)
import Tidy.Codegen (binaryOp, binderWildcard, dataCtor, declData, declImport, declInstance, declType, exprApp, exprIdent, exprOp, exprRecord, exprSection, exprString, importOp, importType, instValue, typeApp, typeConstrained, typeCtor, typeForall, typeVar)

importRequired :: Partial => Array ( ImportDecl Void )
importRequired =
    pure $ declImport "Control.Semigroupoid" [ importOp "<<<" ]

imports :: Partial => Set ( Attribute /\ Element ) -> Array ( ImportDecl Void )
imports attrAndElts = 
    Array.concat
        [ typeImports $ Array.cons TypeUnit $ Set.toUnfoldable $ Set.map ( _.type <<< fst ) attrAndElts
        , importRequired
        , flip map ( Set.toUnfoldable $ Set.map snd attrAndElts ) \elt ->
            declImport ( eltModule elt.ctor ) [ importType $ eltType elt.ctor ]
        ]

generate :: Partial => Set ( Attribute /\ Element ) -> Array ( Declaration Void )
generate attrAndElts | Just ( attr /\ _ ) <- Set.findMin attrAndElts = do
    let { decl, typeName, typeSelf } = declAttrType attr
    Array.concat
        [ decl
        -- create an effect type alias
        , if Set.isEmpty $ Set.filter ( fst >>> _.type >>> eq TypeEventHandler ) attrAndElts then [] else
            [ declType ( typeName <> "Effect" ) []
                $ typeForall [ typeVar "element" ]
                $ typeConstrained
                    [ typeApp ( typeCtor typeAttr ) 
                        [ typeVar "element"
                        , typeSelf
                        , typeApp ( typeCtor "Effect.Effect" ) [ typeCtor "Data.Unit.Unit" ]
                        ]
                    ]
                $ typeEvented $ typeAttributed $ typeVar "element"
            ]

        -- create mappings between attribute and element
        , flip map ( Set.toUnfoldable attrAndElts ) \( { type : type_ } /\ elt ) ->
            declInstance Nothing [] typeAttr
                [ typeCtor ( eltType elt.ctor ), typeSelf, construct type_ ]
                [ instValue "attr" [ binderWildcard ]
                    $ exprOp ( exprIdent "Deku.Attribute.unsafeAttribute" )
                    [ binaryOp "<<<" $ exprRecord [ "key" /\ exprString attr.name, "value" /\ exprSection ]
                    , binaryOp "<<<" $ handler type_
                    ]
                ]
        ]

declAttrType :: Partial => Attribute -> { typeName :: String, typeSelf :: Type Void, decl :: Array ( Declaration Void ) }
declAttrType attr =
    { decl, typeName, typeSelf }

    where
    
    decl :: Array ( Declaration Void )
    decl = 
        [ declData typeName [] [ dataCtor typeName [] ]
        , declInstance Nothing [] typeAttr
            [ typeEverything, typeSelf, typeUnit ]
            [ instValue "attr" [ binderWildcard, binderWildcard ]
                $ exprApp ( exprIdent "Deku.Attribute.unsafeAttribute" )
                [ exprRecord [ "key" /\ exprString attr.name, "value" /\ exprIdent "Deku.Attribute.unset'" ] ]
            ]
        ]

    typeName :: String
    typeName =
        attrType attr.index

    typeSelf :: Partial => Type Void
    typeSelf =
        typeCtor typeName

generateEverything :: Partial => Attribute -> Array ( Declaration Void )
generateEverything attr = do
    let { decl, typeSelf } = declAttrType attr
    Array.concat
        [ decl
        , pure $ declInstance Nothing [] typeAttr
            [ typeEverything, typeSelf, construct attr.type ]
            [ instValue "attr" [ binderWildcard ]
                $ exprOp ( exprIdent "Deku.Attribute.unsafeAttribute" )
                [ binaryOp "<<<" $ exprRecord [ "key" /\ exprString attr.name, "value" /\ exprSection ]
                , binaryOp "<<<" $ handler attr.type
                ]
            ]
        ]

typeAttr :: Proper
typeAttr =
    Proper "Deku.Attribute.Attr"

typeEverything :: Partial => Type Void
typeEverything =
    typeVar "everything"

typeUnit :: Partial => Type Void
typeUnit =
    typeCtor "Data.Unit.Unit"