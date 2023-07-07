module DOM.Indexed.Props where

import Prelude
import Prim hiding (Type)

import DOM.Indexed.Common (AttributeType, Keyword, TypeStub(..), declHandler, attributeMember, attributeName, construct, escape, mapType, overloaded, simpleType)
import DOM.Spec (Interface)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Function (on)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (ClassFundep(..), Declaration, Export, Expr, Type)
import Tidy.Codegen (binaryOp, classMember, declClass, declInstance, declSignature, declValue, exportClass, exportValue, exprIdent, exprOp, instValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeRow, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)

exports :: Foreign.Object ( Array AttributeType ) -> Array ( Export Void )
exports attributes =
    unsafePartial
        $ append [ exportValue "self", exportValue "self_" ]
        $ bind ( Foreign.toUnfoldable attributes ) \( srcName /\ types ) -> do
            let name = escape srcName
                ctor /\ shortHand = attributeName srcName
            case types of
                [] ->
                    []

                [ _ ] ->
                    [ exportValue ctor
                    , exportValue shortHand
                    ]
            
                _ -> do
                    let overloadedHandler /\ overloadedClass = overloaded name
                    [ exportValue ctor
                    , exportValue shortHand
                    , exportClass overloadedClass
                    , exportValue overloadedHandler
                    ]

generate :: Foreign.Object ( Array AttributeType ) -> Array ( Declaration Void )
generate attributes =
    unsafePartial
        $ append declCommon
        $ declAttr attributes

declAttr :: Partial => Foreign.Object ( Array AttributeType ) -> Array ( Declaration Void )
declAttr attributes =
    bind ( Foreign.toUnfoldable attributes ) \( srcName /\ types ) -> do
        let name = escape srcName
            ctor /\ shortHand = attributeName srcName 
        case types of
            -- no corresponding type found for this attribute so we wont emit a function
            [] ->
                []
            
            -- generate simple function definition
            [ { type : t, original, handler } ] -> do
                [ declSignature ctor
                    $ typeForall [ typeVar "r" ]
                    $ typeArrow [ typeApp ( typeCtor "Event" ) [ construct t ] ]
                    $ typeEvented name $ construct original
                , declHandler ctor srcName handler

                , declSignature shortHand 
                    $ typeForall [ typeVar "r" ]
                    $ typeArrow [ construct t ]
                    $ typeEvented name $ construct original
                , declValue shortHand [] $ exprOp ( exprIdent ctor ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ] 
                ]
            
            -- generate typeclass plus function definition to overload attribute
            multiple -> do
                let overloadedHandler /\ overloadedClass = overloaded name
                [ declClass [] overloadedClass
                    [ typeVarKinded "v" $ typeCtor "Type" 
                    , typeVarKinded "a" $ typeCtor "Type"
                    ]
                    [ FundepDetermines ( NEA.singleton ( toName "v") ) tokRightArrow ( NEA.singleton ( toName "a" ) )
                    ]
                    [ classMember overloadedHandler $ typeArrow [ typeVar "v" ] $ typeCtor "AttributeValue"
                    ]
                ]
                    <> map ( declHandlerInstance overloadedClass overloadedHandler ) multiple
                    <>
                    [ declSignature ctor
                        $ typeForall [ typeVar "r", typeVar "v", typeVar "a" ]
                        $ typeConstrained [ typeApp ( typeCtor overloadedClass ) [ typeVar "v", typeVar "a" ] ]
                        $ typeArrow [ typeApp ( typeCtor "Event" ) [ typeVar "v" ] ]
                        $ typeEvented name ( typeVar "a" )
                    , declHandler ctor srcName $ exprIdent overloadedHandler

                    , declSignature shortHand
                        $ typeForall [ typeVar "r", typeVar "v", typeVar "a" ]
                        $ typeConstrained [ typeApp ( typeCtor overloadedClass ) [ typeVar "v", typeVar "a" ] ]
                        $ typeArrow [ typeVar "v" ]
                        $ typeEvented name ( typeVar "a" )
                    , declValue shortHand [] $ exprOp ( exprIdent ctor ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ] 
                    ]

    where

    declHandlerInstance :: String -> String -> AttributeType -> Declaration Void
    declHandlerInstance className member { type : t, original, handler } =
        unsafePartial 
            $ declInstance Nothing [] className
                [ construct t
                , construct original
                ]
                [ instValue member [] handler ]

typeEvented :: String -> Type Void -> Type Void
typeEvented name typeDecl =
    unsafePartial
        $ typeApp ( typeCtor "Event" ) [ typePure name typeDecl ]

typePure :: String -> Type Void -> Type Void
typePure name typeDecl = 
    unsafePartial
        $ typeApp ( typeCtor "Attribute" ) 
        [ typeApp ( typeCtor "Indexed" )
            [ typeRow [ name /\ typeDecl ]
                $ Just $ typeVar "r"
            ]
        ]

coalesceAttributes :: Array Keyword -> Foreign.Object ( Interface /\ Array String ) -> Foreign.Object ( Array AttributeType )
coalesceAttributes keywords interfaces = do
    let
        fromKeywords :: Foreign.Object ( Array AttributeType )
        fromKeywords =
            Foreign.fromFoldableWith append do
                { attribute, value } <- keywords
                pure $ attribute /\ pure
                    { type : TypeIdent [ TypeSymbol value ] "Keyword" 
                    , original : simpleType "String"
                    , handler : keywordAttributeValue
                    }

        fromInterfaces :: Foreign.Object ( Array AttributeType )
        fromInterfaces =
            Foreign.fromFoldableWith append do
                interface /\ _ <- Foreign.values interfaces
                member <- fromMaybe [] interface.members
                name /\ t <- attributeMember member
                pure $ name /\ mapType t
    
    map ( Array.nubBy ( compare `on` _.type ) ) $ Foreign.unionWith append fromInterfaces fromKeywords

declCommon :: Array ( Declaration Void )
declCommon = unsafePartial
    [ declSignature "boolAttributeValue" $ typeArrow [ typeCtor "Boolean" ] typeAttributeValue
    , declValue "boolAttributeValue" [] $ exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Show.show" ] 

    , declSignature "numberAttributeValue" $ typeArrow [ typeCtor "Number" ] typeAttributeValue
    , declValue "numberAttributeValue" [] $ exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Show.show" ]
    
    , declSignature "intAttributeValue" $ typeArrow [ typeCtor "Int" ] typeAttributeValue
    , declValue "intAttributeValue" [] $ exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Show.show" ]

    , declSignature "keywordAttributeValue"
        $ typeForall [ typeVar "v" ]
        $ typeArrow [ typeApp ( typeCtor "Keyword" ) [ typeVar "v" ] ] typeAttributeValue
    , declValue "keywordAttributeValue" []
        $ exprOp ( exprIdent "prop'" ) [ binaryOp "<<<" $ exprIdent "Newtype.unwrap" ]
    ]

keywordAttributeValue :: Expr Void
keywordAttributeValue =
    unsafePartial $ exprIdent "keywordAttributeValue"

typeAttributeValue :: Type Void
typeAttributeValue =
    unsafePartial $ typeCtor "AttributeValue"
