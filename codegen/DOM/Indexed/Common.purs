module DOM.Indexed.Common where

import Prelude
import Prim hiding (Type)

import DOM.Common (TypeStub(..), camelCaseOn, capitalize, escape, typeImports)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\), (/\))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Expr, ImportDecl, Type)
import Tidy.Codegen (binaryOp, declImport, declImportAs, declValue, exprApp, exprIdent, exprOp, exprRecord, exprSection, exprString, importOp, importType, importValue, typeApp, typeCtor, typeRow, typeVar)

requires :: Array ( ImportDecl Void )
requires =
    unsafePartial
        $ append
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
            ]
        $ typeImports [ TypeInt, TypeString, TypeBoolean, TypeNumber, TypeEventHandler, TypeKeyword "" ]

declHandler :: String -> String -> Expr Void -> Declaration Void
declHandler name srcName handler =
    unsafePartial
        $ declValue name []
        $ exprApp ( exprIdent "Functor.map" )
        [ exprOp ( exprIdent "unsafeAttribute" )
            [ binaryOp "<<<" $ exprRecord [ "key" /\ exprString srcName, "value" /\ exprSection ]
            , binaryOp "<<<" handler
            ]
        ]

typeIndexed :: Type Void -> Type Void
typeIndexed t =
    unsafePartial $ typeApp ( typeCtor "Indexed" ) $ pure t

typeIndexedAt :: String -> Type Void -> Type Void
typeIndexedAt n t =
    unsafePartial $ typeIndexed $ typeRow [ n /\ t ] $ Just $ typeVar "r"

tagName :: String -> String /\ String
tagName src = do
    let
        e = escape src
        short = e <> "_"
    e /\ short

attributeName :: String -> String /\ String
attributeName "className" = "_class" /\ "_class_"
attributeName src = do
    let
        e = "_" <> camelCaseOn src
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

nominal :: String
nominal =
    "__nominal"

type Keyword =
    { name :: String
    , value :: String
    , attribute :: String
    }
