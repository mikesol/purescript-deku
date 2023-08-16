module DOM.TypeStub where

import Prelude
import Prim hiding (Type)

import Data.Array as Array
import Data.Generic.Rep (class Generic)
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Expr, ImportDecl, Type)
import Tidy.Codegen (binaryOp, declImportAs, exprCtor, exprIdent, typeApp, typeArrow, typeCtor, typeString)
import Tidy.Codegen.Types (BinaryOp)

-- | Intermediate type between `IDLType` and `Type a` so we can implement an `Ord` and `Eq` instance for deduping. 
data TypeStub 
    = TypeInt
    | TypeString
    | TypeBoolean
    | TypeNumber
    | TypeEventHandler
    | TypeKeyword String
    | TypeUnit
    | TypeSelfHandler
    | TypeEventEffect
derive instance Eq TypeStub
derive instance Ord TypeStub
derive instance Generic TypeStub _

construct :: forall a . TypeStub -> Type a
construct = unsafePartial case _ of
    TypeInt -> typeCtor "Int"
    TypeString -> typeCtor "String"
    TypeBoolean -> typeCtor "Boolean"
    TypeNumber -> typeCtor "Number"
    
    TypeEventHandler ->
        typeArrow
            [ typeCtor "Web.Event.Internal.Types.Event" ]
            $ typeApp ( typeCtor "Effect.Effect" ) [ typeCtor "Data.Unit.Unit" ]
    
    TypeKeyword ix ->
        typeApp ( typeCtor "Types.Keyword" ) [ typeString ix ]
    
    TypeUnit ->
        typeCtor "Data.Unit.Unit"

    TypeEventEffect ->
        typeCtor "Types.EventEffect"

-- | Generates the necessary imports for the given `TypeStub`s.
typeImports :: forall e . Array TypeStub -> Array ( ImportDecl e )
typeImports stubs =
    unsafePartial $ flip map ( Array.nub $ bind stubs modules ) \mod ->
        declImportAs mod [] mod

    where

    modules = case _ of
        TypeInt -> [ "Deku.Attribute", "Data.Show" ] -- prop', show
        TypeString -> [ "Deku.Attribute" ] -- prop'
        TypeBoolean -> [ "Deku.Attribute", "Data.Show" ] -- prop', show
        TypeNumber -> [ "Deku.Attribute", "Data.Show" ] -- prop', show
        TypeEventHandler ->
            [ "Effect" -- Effect
            , "Web.Event.Internal.Types" -- Event
            , "Data.Unit" -- Unit
            , "Deku.Attribute" -- cb, cb'
            ]
        TypeKeyword _ ->
            [ "Deku.Attribute", "Data.Newtype" ] -- unwrap
        
        TypeUnit ->
            [ "Deku.Attribute", "Data.Unit" ] -- unset'

        TypeSelfHandler ->
            [ "Effect" -- Effect
            , "Data.Unit" -- Unit
            , "Deku.Attribute" -- cb, Cb
            , "Unsafe.Coerce" -- unsafeCoerce
            ]

        TypeEventEffect ->
            [ "Deku.DOM.Types", "Deku.Attribute" ]

-- | Generates a handler that can convert the type indicated by the `TypeStub` to an `AttributeValue` 
handler :: forall e . TypeStub -> Array ( BinaryOp ( Expr e ) ) 
handler = unsafePartial case _ of
    TypeInt ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Show.show"
        ]
    
    TypeString ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'" ]

    TypeBoolean ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Show.show"
        ]

    TypeNumber ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Show.show"
        ]
    
    TypeEventHandler ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.cb'"
        , binaryOp "<<<" $ exprIdent "Deku.Attribute.cb"
        ]

    TypeKeyword _ ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.prop'"
        , binaryOp "<<<" $ exprIdent "Data.Newtype.unwrap"
        ]

    TypeSelfHandler ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.cb'"
        , binaryOp "<<<" $ exprCtor "Deku.Attribute.Cb"
        , binaryOp "<<<" $ exprIdent "Unsafe.Coerce.unsafeCoerce" 
        ]

    TypeEventEffect ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.cb'"
        , binaryOp "<<<" $ exprIdent "Deku.Attribute.cb"
        ]
