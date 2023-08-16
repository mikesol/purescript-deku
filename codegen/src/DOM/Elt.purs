-- | Module to generate the Element-modules of the old DOM implementation.
module DOM.Elt where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor(..), Element, eltType, typeArrayed, typeAttributed, typeEvented, typeNut)
import Data.Newtype (un)
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, ImportDecl)
import Tidy.Codegen (binderVar, declData, declImport, declImportAs, declSignature, declValue, exprApp, exprArray, exprIdent, exprString, importType, importValue, typeArrow, typeCtor)

imports :: Array ( ImportDecl Void )
imports =
    unsafePartial $
        [ declImport "Control.Plus" [ importValue "empty" ]
        , declImportAs "Deku.Attribute" [] "Deku.Attribute"
        , declImportAs "Deku.Control" [] "DC"
        , declImport "Deku.Core" [ importType "Nut" ]
        , declImportAs "FRP.Event" [] "FRP.Event" 
        ]

generate :: Partial => Element -> Array ( Declaration Void )
generate element = do
    let { typeMarker, name, short, shortest } = names element.ctor
        
    [ declData typeMarker [] []
        
    , declSignature name
        $ typeArrow
            [ typeArrayed $ typeEvented $ typeAttributed $ typeCtor typeMarker
            , typeArrayed typeNut
            ]
        $ typeNut
    , declValue name []
        $ exprApp ( exprIdent "DC.elementify2" ) [ exprString element.tag ]

    , declSignature short
        $ typeArrow [ typeArrayed typeNut ]
        $ typeNut
    , declValue short []
        $ exprApp ( exprIdent $ un Ctor element.ctor ) [ exprIdent "empty" ]
    
    
    , declSignature shortest
        $ typeArrow [ typeCtor "String" ]
        $ typeNut
    , declValue shortest [ binderVar "t" ]
        $ exprApp ( exprIdent $ un Ctor element.ctor <> "_" )
        [ exprArray [ exprApp ( exprIdent "DC.text_" ) [ exprIdent "t" ] ] ]
    ]

names :: Ctor -> { typeMarker :: String, name :: String, short :: String, shortest :: String }
names ctor =
    { typeMarker : eltType ctor
    , name : un Ctor ctor
    , short : un Ctor ctor <> "_"
    , shortest : un Ctor ctor <> "__"
    }