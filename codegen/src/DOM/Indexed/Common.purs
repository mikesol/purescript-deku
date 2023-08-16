module DOM.Indexed.Common where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor(..), capitalize)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\), (/\))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (ImportDecl, Type)
import Tidy.Codegen (declImport, declImportAs, importOp, importType, importTypeAll, importValue, typeRow, typeVar)

requires :: Partial => Array ( ImportDecl Void )
requires =
    [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
    , declImport "Control.Category" [ importOp "<<<" ]
    , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
    , declImportAs "FRP.Event" [] "FRP.Event"
    
    , declImport "Deku.Control" [ importValue "elementify2" ]
    , declImport "Deku.Core" [ importType "Nut" ]
    , declImport "Type.Proxy" [ importType "Proxy" ]
    , declImportAs "Deku.DOM.Types" [ importValue "_unset", importTypeAll "Keyword", importType "EventEffect" ] "Types"
    ]

typeIndexedAt :: Ctor -> Type Void -> Type Void
typeIndexedAt n t =
    unsafePartial $ typeRow [ n /\ t ] $ Just $ typeVar "r"

tagCtor :: Ctor -> String /\ String
tagCtor ( Ctor src ) = do
    let short = src <> "_"
    src /\ short

attributeCtor :: Ctor -> String /\ String
attributeCtor ( Ctor src ) = do
    let
        e = "_" <> src
        short = e <> "_"
    e /\ short

valueCtor :: Ctor -> String
valueCtor ( Ctor src ) =
    "__" <> src

overloaded :: Ctor -> String /\ String
overloaded ( Ctor srcName ) = do
    let
        capName = capitalize srcName
        overloadedHandler = "is" <> capName
        overloadedClass = "Is" <> capName
    overloadedHandler /\ overloadedClass

nominal :: Ctor
nominal =
    Ctor "__nominal"
