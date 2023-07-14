module DOM.Indexed.Props where

import Prelude
import Prim hiding (Type)

import DOM.Common (TypeStub(..), attributeMember, construct, escape, handler, mapType, typeAttributed, typeEvented)
import DOM.Indexed.Common (Keyword, declHandler, attributeName, typeIndexedAt, overloaded)
import DOM.Spec (Interface)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Function (on)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (ClassFundep(..), Declaration, Export)
import Tidy.Codegen (binaryOp, classMember, declClass, declInstance, declSignature, declValue, exportClass, exportValue, exprIdent, exprOp, instValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)

exports :: Partial => Foreign.Object ( Array AttributeType ) -> Array ( Export Void )
exports attributes =
    append [ exportValue "self", exportValue "self_" ]
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

generate :: Partial => Foreign.Object ( Array AttributeType ) -> Array ( Declaration Void )
generate attributes =
    declUnset <> declAttr attributes

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
            [ { type : t, original } ] -> do
                [ declSignature ctor
                    $ typeForall [ typeVar "r" ]
                    $ typeArrow [ typeEvented $ construct t ]
                    $ typeEvented $ typeAttributed $ typeIndexedAt name $ construct original
                , declHandler ctor srcName $ handler t

                , declSignature shortHand 
                    $ typeForall [ typeVar "r" ]
                    $ typeArrow [ construct t ]
                    $ typeEvented $ typeAttributed $ typeIndexedAt name $ construct original
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
                        $ typeArrow [ typeEvented $ typeVar "v" ]
                        $ typeEvented $ typeAttributed $ typeIndexedAt name ( typeVar "a" )
                    , declHandler ctor srcName $ exprIdent overloadedHandler

                    , declSignature shortHand
                        $ typeForall [ typeVar "r", typeVar "v", typeVar "a" ]
                        $ typeConstrained [ typeApp ( typeCtor overloadedClass ) [ typeVar "v", typeVar "a" ] ]
                        $ typeArrow [ typeVar "v" ]
                        $ typeEvented $ typeAttributed $ typeIndexedAt name ( typeVar "a" )
                    , declValue shortHand [] $ exprOp ( exprIdent ctor ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ] 
                    ]

    where

    declHandlerInstance :: String -> String -> AttributeType -> Declaration Void
    declHandlerInstance className member { type : t, original } =
        declInstance Nothing [] className
            [ construct t
            , construct original
            ]
            [ instValue member [] $ handler t ]

declUnset :: Partial => Array ( Declaration Void )
declUnset =
    [ 

    ]

type AttributeType =
    { type :: TypeStub -- type as input
    , original :: TypeStub -- type in index
    }

mkAttributeType :: TypeStub -> AttributeType
mkAttributeType original =
    { type : original, original }

coalesceAttributes :: Array Keyword -> Foreign.Object ( Interface /\ Array String ) -> Foreign.Object ( Array AttributeType )
coalesceAttributes keywords interfaces = do
    let
        fromKeywords :: Foreign.Object ( Array AttributeType )
        fromKeywords =
            Foreign.fromFoldableWith append do
                { attribute, value } <- keywords
                pure $ attribute /\ pure
                    { type : TypeKeyword value 
                    , original : TypeString
                    }

        fromInterfaces :: Foreign.Object ( Array AttributeType )
        fromInterfaces =
            Foreign.fromFoldableWith append do
                interface /\ _ <- Foreign.values interfaces
                member <- fromMaybe [] interface.members
                name /\ t <- attributeMember member
                pure $ name /\ ( mkAttributeType <$> mapType t )
    
    map ( Array.nubBy ( compare `on` _.type ) ) $ Foreign.unionWith append fromInterfaces fromKeywords
