module DOM.Indexed.Props where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor(..), Interface, Keyword, declHandler, typeAttributed, typeEvented)
import DOM.Indexed.Common (attributeCtor, typeIndexedAt, overloaded)
import DOM.TypeStub (TypeStub(..), construct, handler)
import Data.Array as Array
import Data.Array.NonEmpty as NEA
import Data.Bifunctor (lmap)
import Data.Function (on)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import PureScript.CST.Types (ClassFundep(..), Declaration, Export)
import Tidy.Codegen (binaryOp, binderVar, classMember, declClass, declInstance, declSignature, declValue, exportClass, exportValue, exprIdent, exprLambda, exprOp, instValue, typeApp, typeArrow, typeConstrained, typeCtor, typeForall, typeVar, typeVarKinded)
import Tidy.Codegen.Class (toName)
import Tidy.Codegen.Common (tokRightArrow)
import Tidy.Codegen.Types (BinaryOp(..))

exports :: Partial => Array ( Ctor /\  Array AttributeType ) -> Array ( Export Void )
exports attributes =
    bind attributes \( index /\ types ) -> do
        let ctor /\ shortHand = attributeCtor index
        case types of
            [] ->
                []

            [ _ ] ->
                [ exportValue ctor
                , exportValue shortHand
                ]
        
            _ -> do
                let overloadedHandler /\ overloadedClass = overloaded index
                [ exportValue ctor
                , exportValue shortHand
                , exportClass overloadedClass
                , exportValue overloadedHandler
                ]

generate :: Partial => Array ( Ctor /\  Array AttributeType ) -> Array ( Declaration Void )
generate attributes =
    declUnset <> declAttr attributes

declAttr :: Partial => Array ( Ctor /\  Array AttributeType ) -> Array ( Declaration Void )
declAttr attributes =
    bind attributes \( index /\ types ) -> do
        let ctor /\ shortHand = attributeCtor index
        case types of
            -- generate simple function definition
            [ { type : t, original, attribute } ] -> do
                [ declSignature ctor
                    $ typeForall [ typeVar "r" ]
                    $ typeArrow [ typeEvented $ construct t ]
                    $ typeEvented $ typeAttributed $ typeIndexedAt index $ construct original
                , declHandler ctor attribute $ handler t

                , declSignature shortHand 
                    $ typeForall [ typeVar "r" ]
                    $ typeArrow [ construct t ]
                    $ typeEvented $ typeAttributed $ typeIndexedAt index $ construct original
                , declValue shortHand [] $ exprOp ( exprIdent ctor ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ] 
                ]
            
            -- generate typeclass plus function definition to overload attribute
            multiple | Just { attribute } <- Array.head multiple -> do
                let overloadedHandler /\ overloadedClass = overloaded index
                [ declClass [] overloadedClass
                    [ typeVarKinded "v" $ typeCtor "Type" 
                    , typeVarKinded "a" $ typeCtor "Type"
                    ]
                    [ FundepDetermines ( NEA.singleton ( toName "v" ) ) tokRightArrow ( NEA.singleton ( toName "a" ) )
                    ]
                    [ classMember overloadedHandler $ typeArrow [ typeVar "v" ] $ typeCtor "Deku.Attribute.AttributeValue"
                    ]
                ]
                    <> map ( declHandlerInstance overloadedClass overloadedHandler ) multiple
                    <>
                    [ declSignature ctor
                        $ typeForall [ typeVar "r", typeVar "v", typeVar "a" ]
                        $ typeConstrained [ typeApp ( typeCtor overloadedClass ) [ typeVar "v", typeVar "a" ] ]
                        $ typeArrow [ typeEvented $ typeVar "v" ]
                        $ typeEvented $ typeAttributed $ typeIndexedAt index ( typeVar "a" )
                    , declHandler ctor attribute [ binaryOp "<<<" $ exprIdent overloadedHandler ]

                    , declSignature shortHand
                        $ typeForall [ typeVar "r", typeVar "v", typeVar "a" ]
                        $ typeConstrained [ typeApp ( typeCtor overloadedClass ) [ typeVar "v", typeVar "a" ] ]
                        $ typeArrow [ typeVar "v" ]
                        $ typeEvented $ typeAttributed $ typeIndexedAt index ( typeVar "a" )
                    , declValue shortHand [] $ exprOp ( exprIdent ctor ) [ binaryOp "<<<" $ exprIdent "Applicative.pure" ] 
                    ]

            -- no corresponding type found for this attribute so we wont emit a function
            _ ->
                []

    where

    declHandlerInstance :: String -> String -> AttributeType -> Declaration Void
    declHandlerInstance className member { type : t, original } =
        declInstance Nothing [] className
            [ construct t
            , construct original
            ]
            $ pure $ instValue member [] case Array.uncons $ handler t of
                Just { head : BinaryOp ( _ /\ expr ), tail : handlers } ->
                    exprOp expr handlers
                
                Nothing ->
                    exprLambda [ binderVar "a" ] $ exprIdent "a"

declUnset :: Partial => Array ( Declaration Void )
declUnset =
    []

type AttributeType =
    { type :: TypeStub -- type as input
    , original :: TypeStub -- type in index
    , attribute :: String
    }

mkAttributeType :: String -> TypeStub -> AttributeType
mkAttributeType attribute original =
    { type : original, original, attribute }

-- | Summarizes all available attribute-values, attributes and properties into a map of deku-attribute names and their
-- | possible types.
coalesceAttributes ::
    Array Keyword
    -> Array Interface
    -> Array ( Ctor /\  Array AttributeType )
coalesceAttributes values interfaces = do
    let
        fromKeywords :: Foreign.Object ( Array AttributeType )
        fromKeywords =
            Foreign.fromFoldableWith append do
                { index : Ctor index, value, attribute } <- values
                pure $ index /\ pure
                    { type : TypeKeyword value 
                    , original : TypeString
                    , attribute
                    }

        fromElements :: Foreign.Object ( Array AttributeType )
        fromElements =
            Foreign.fromFoldableWith append
                $ map (\{ type : t, index : Ctor index, name } -> index /\ [ mkAttributeType name t ] )
                $ Array.nub
                $ Array.concat
                $ map _.members interfaces
                            
    map ( lmap Ctor )
        $ Foreign.toUnfoldable
        $ map ( Array.nubBy ( compare `on` _.type ) )
        $ Foreign.unionWith append fromElements fromKeywords
