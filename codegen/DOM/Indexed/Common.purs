module DOM.Indexed.Common where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor(..))
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\), (/\))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Expr, ImportDecl, Type)
import Tidy.Codegen (binaryOp, declImport, declImportAs, declValue, exprApp, exprIdent, exprOp, exprRecord, exprSection, exprString, importOp, importType, importTypeAll, importValue, typeApp, typeCtor, typeRow, typeVar)

requires :: Partial => Array ( ImportDecl Void )
requires =
    [ declImportAs "Control.Applicative" [ importValue "pure" ] "Applicative"
    , declImport "Control.Category" [ importOp "<<<" ]
    , declImportAs "Data.Functor" [ importValue "map" ] "Functor"
    
    , declImport "Deku.Attribute"
        [ importType "Attribute"
        , importType "AttributeValue"
        , importValue "unsafeAttribute"
        ]
    , declImport "Deku.Control" [ importValue "elementify2" ]
    , declImport "Deku.Core" [ importType "Nut" ]
    , declImport "FRP.Event" [ importType "Event" ]
    , declImport "Type.Proxy" [ importType "Proxy" ]
    , declImport "Deku.DOM.Indexed.Index" [ importType "Indexed", importTypeAll "Keyword"  ]
    ]

declHandler :: String -> String -> Expr Void -> Declaration Void
declHandler name index handler =
    unsafePartial
        $ declValue name []
        $ exprApp ( exprIdent "Functor.map" )
        [ exprOp ( exprIdent "unsafeAttribute" )
            [ binaryOp "<<<" $ exprRecord [ "key" /\ exprString index, "value" /\ exprSection ]
            , binaryOp "<<<" handler
            ]
        ]

typeIndexed :: Type Void -> Type Void
typeIndexed t =
    unsafePartial $ typeApp ( typeCtor "Indexed" ) $ pure t

typeIndexedAt :: Ctor -> Type Void -> Type Void
typeIndexedAt n t =
    unsafePartial $ typeIndexed $ typeRow [ n /\ t ] $ Just $ typeVar "r"

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
        capName = srcName
        overloadedHandler = "is" <> capName
        overloadedClass = "Is" <> capName
    overloadedHandler /\ overloadedClass

nominal :: Ctor
nominal =
    Ctor "__nominal"
