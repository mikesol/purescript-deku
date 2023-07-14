module DOM.Elt where

import Prelude
import Prim hiding (Type)

import DOM.Common (typeArrayed, typeAttributed, typeEvented, typeNut)
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, ImportDecl)
import Tidy.Codegen (binderVar, declData, declImport, declImportAs, declSignature, declValue, exprApp, exprArray, exprIdent, exprString, importType, importValue, typeArrow, typeCtor)

type Elt =
    { tag :: String
    , name :: String
    , module :: String
    , type :: String
    , interface :: String
    }

imports :: Array ( ImportDecl Void )
imports =
    unsafePartial $
        [ declImport "Control.Plus" [ importValue "empty" ]
        , declImport "Deku.Attribute" [ importType "Attribute" ]
        , declImportAs "Deku.Control" [] "DC"
        , declImport "Deku.Core" [ importType "Nut" ]
        , declImport "FRP.Event" [ importType "Event" ] 
        ]

generate :: Elt -> Array ( Declaration Void )
generate element =
    unsafePartial $
        [ declData element.type [] []
            
        , declSignature element.name 
            $ typeArrow
                [ typeArrayed $ typeEvented $ typeAttributed $ typeCtor element.type
                , typeArrayed typeNut
                ]
            $ typeNut
        , declValue element.name []
            $ exprApp ( exprIdent "DC.elementify2" ) [ exprString element.tag ]

        , declSignature ( element.name <> "_" ) 
            $ typeArrow [ typeArrayed typeNut ]
            $ typeNut
        , declValue ( element.name <> "_" ) []
            $ exprApp ( exprIdent element.name ) [ exprIdent "empty" ]
        
        
        , declSignature ( element.name <> "__" ) 
            $ typeArrow [ typeCtor "String" ]
            $ typeNut
        , declValue ( element.name <> "__" ) [ binderVar "t" ]
            $ exprApp ( exprIdent $ element.name <> "_" )
            [ exprArray [ exprApp ( exprIdent "DC.text_" ) [ exprIdent "t" ] ] ]
        ]
