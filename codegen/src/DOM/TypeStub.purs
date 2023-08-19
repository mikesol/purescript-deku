module DOM.TypeStub where

import Prelude
import Prim hiding (Type)

import Data.Array as Array
import Data.Generic.Rep (class Generic)
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Expr, ImportDecl, Type)
import Tidy.Codegen (binaryOp, declImportAs, exprIdent, typeApp, typeArrow, typeCtor)
import Tidy.Codegen.Types (BinaryOp)

-- | Intermediate type between `IDLType` and `Type a` so we can implement an `Ord` and `Eq` instance for deduping. 
data TypeStub 
    = TypeInt
    | TypeString
    | TypeBoolean
    | TypeNumber
    | TypeUnit
    | TypeEvent String String
derive instance Eq TypeStub
derive instance Ord TypeStub
derive instance Generic TypeStub _

-- | Type as it appears in the index.
constructIndex :: forall a . TypeStub -> Type a
constructIndex = unsafePartial case _ of
    TypeInt -> typeCtor "Int"
    TypeString -> typeCtor "String"
    TypeBoolean -> typeCtor "Boolean"
    TypeNumber -> typeCtor "Number"
            
    TypeUnit ->
        typeCtor "Data.Unit.Unit"

    TypeEvent t mod ->
        typeCtor $ mod <> "." <> t

-- | Type as argument.
constructArg :: forall a . TypeStub -> Type a
constructArg = unsafePartial case _ of
    TypeInt -> typeCtor "Int"
    TypeString -> typeCtor "String"
    TypeBoolean -> typeCtor "Boolean"
    TypeNumber -> typeCtor "Number"
            
    TypeUnit ->
        typeCtor "Data.Unit.Unit"

    TypeEvent t mod ->
        typeArrow [ typeCtor $ mod <> "." <> t ] $ typeApp ( typeCtor "Effect.Effect" ) [ typeCtor "Data.Unit.Unit" ]

-- | Generates the necessary imports for the handler of collection of `TypeStub`s.
handlerImports :: forall e . Array TypeStub -> Array ( ImportDecl e )
handlerImports stubs =
    unsafePartial $ flip map ( Array.nub $ bind stubs modules ) \mod ->
        declImportAs mod [] mod

    where

    modules = case _ of
        TypeInt ->
            [ "Deku.Attribute", "Data.Show" ] -- prop', show
        
        TypeString ->
            [ "Deku.Attribute" ] -- prop'
        
        TypeBoolean ->
            [ "Deku.Attribute", "Data.Show" ] -- prop', show
        
        TypeNumber ->
            [ "Deku.Attribute", "Data.Show" ] -- prop', show
        
        TypeEvent _ mod ->
            [ "Deku.Attribute" -- cb, cb'
            , mod -- the Event type
            , "Effect" -- Effect
            , "Data.Unit" -- Unit
            , "Unsafe.Coerce" -- unsafeCoerce
            ]

        TypeUnit ->
            [ "Deku.Attribute", "Data.Unit" ] -- unset'

-- | Generates the necessary imports for the index of a collection of `TypeStub`s.
indexImports :: forall e . Array TypeStub -> Array ( ImportDecl e )
indexImports stubs =
    unsafePartial $ flip map ( Array.nub $ bind stubs modules ) \mod ->
        declImportAs mod [] mod

    where
    
    modules = case _ of
        TypeInt ->
            [] -- prop', show
        
        TypeString ->
            [] -- prop'
        
        TypeBoolean ->
            [] -- prop', show
        
        TypeNumber ->
            [] -- prop', show
        
        TypeEvent _ mod ->
            [ mod ] -- the Event type

        TypeUnit ->
            [ "Data.Unit" ] -- unset'

-- | Generates a handler that can convert the type indicated by the `TypeStub` to an `AttributeValue`.
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
    
    TypeEvent _ _ ->
        [ binaryOp "<<<" $ exprIdent "Deku.Attribute.cb'"
        , binaryOp "<<<" $ exprIdent "Deku.Attribute.cb"
        , binaryOp "<<<" $ exprIdent "Unsafe.Coerce.unsafeCoerce"
        ]
