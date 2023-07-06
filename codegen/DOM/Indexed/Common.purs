module DOM.Indexed.Common where

import Prelude
import Prim hiding (Type)

import DOM.Common (capitalize)
import DOM.Spec (IDLType(..), Member(..))
import Data.Maybe (maybe)
import Data.Set (Set)
import Data.Set as Set
import Data.Tuple.Nested (type (/\), (/\))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Expr, ImportDecl, Type)
import Tidy.Codegen (declImport, declImportAs, exprIdent, importClass, importOp, importType, importValue, typeApp, typeCtor, typeString)

requires :: Array ( ImportDecl Void )
requires =
    unsafePartial
        [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
        , declImport "Control.Category" [ importOp "<<<" ]
        , declImport "Data.Function" [ importOp "$"]
        , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
        , declImportAs "Data.Newtype" [ importValue "unwrap", importClass "Newtype" ] "Newtype"
        , declImportAs "Data.Show" [ importValue "show" ] "Show"
        
        , declImport "Deku.Attribute"
            [ importType "Cb"
            , importType "Attribute"
            , importType "AttributeValue"
            , importValue "unsafeAttribute"
            , importValue "prop'"
            , importValue "cb'"
            ]
        , declImport "Deku.Control" [ importValue "elementify2" ]
        , declImport "Deku.Core" [ importType "Nut" ]
        , declImport "FRP.Event" [ importType "Event" ]
        ]

simpleType :: String -> TypeStub
simpleType =
    TypeStub <<< { ctor : _, args : [], symbol : false }

newtype TypeStub =
    TypeStub
        { ctor :: String, args :: Array TypeStub, symbol :: Boolean }
derive instance Eq TypeStub
derive instance Ord TypeStub

construct :: forall e . TypeStub -> Type e
construct ( TypeStub { ctor, symbol : true } ) = unsafePartial $ typeString ctor
construct ( TypeStub { ctor, args : [] } ) = unsafePartial $ typeCtor ctor
construct ( TypeStub { ctor, args } ) = unsafePartial $ typeApp ( typeCtor ctor ) $ map construct args

type Keyword =
    { name :: String
    , value :: String
    , attribute :: String
    }

type AttributeType =
    { type :: TypeStub
    , original :: TypeStub
    , handler :: Expr Void
    }
    
is :: String -> Boolean
is k =
    Set.member k keywords

escape :: String -> String
escape n = 
    if is n then "x" <> n else n

keywords :: Set String
keywords =
    Set.fromFoldable
        [ "data"
        , "if"
        , "class"
        , "type"
        ]

tagName :: String -> String /\ String
tagName src = do
    let
        e = escape src
        short = e <> "_"
    e /\ short

attributeName :: String -> String /\ String
attributeName src = do
    let
        e = "_" <> escape src
        short = e <> "_"
    e /\ short

valueName :: String -> String
valueName =
    append "__"

overloaded :: String -> String /\ String
overloaded srcName = do
    let
        capName = capitalize srcName
        overloadedHandler = "is" <> capName
        overloadedClass = "Is" <> capName
    overloadedHandler /\ overloadedClass

attributeMember :: Member -> Array ( String /\ IDLType )
attributeMember = case _ of
        -- only emit writeable(not readonly attributes)
        Attribute { idlType, name : attrName, readonly } | maybe true not readonly ->
            [ attrName /\ idlType ]
        
        _ ->
            []

mapType :: IDLType -> Array AttributeType
mapType = case _ of
    Descriptor t -> mapType t.idlType

    Primitive "boolean" ->
        pure bool
    
    Primitive "long" ->
        pure int

    Primitive "unsigned long" ->
        pure int

    Primitive "long long" ->
        pure int
    
    Primitive "unsigned long long" -> 
        pure int

    Primitive "unsigned short" ->
        pure int

    Primitive "double" -> 
        pure number

    Primitive "unrestricted double" ->
        pure number

    Primitive "EventHandler" ->
        pure cb

    Primitive "any" ->
        pure string

    Primitive "DOMString" ->
        pure string

    Primitive "DOMTokenList" ->
        pure string

    Primitive "USVString" ->
        pure string
    
    Union s ->
        bind s mapType

    Primitive _ ->
        []

    where

    f :: String -> Expr Void
    f n = unsafePartial $ exprIdent n

    string :: AttributeType
    string = { type : simpleType "String", original : simpleType "String", handler : f "prop'" }

    int :: AttributeType
    int = { type : simpleType "Int", original : simpleType "Int", handler : f "intAttributeValue" }

    number :: AttributeType
    number = { type: simpleType "Number", original : simpleType "Number", handler : f "numberAttributeValue" }

    bool :: AttributeType
    bool = { type : simpleType "Boolean", original : simpleType "Boolean", handler : f "boolAttributeValue" }

    cb :: AttributeType
    cb = { type : simpleType "Cb", original : simpleType "Cb", handler : f "cb'" }
