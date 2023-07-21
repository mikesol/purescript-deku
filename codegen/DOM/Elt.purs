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
        , declImport "Deku.Attribute" [ importType "Attribute" ]
        , declImportAs "Deku.Control" [] "DC"
        , declImport "Deku.Core" [ importType "Nut" ]
        , declImport "FRP.Event" [ importType "Event" ] 
        ]

generate :: Partial => Element -> Array ( Declaration Void )
generate element = do
    let
        typeName :: String
        typeName = eltType element.ctor
        
    [ declData typeName [] []
        
    , declSignature element.ctor
        $ typeArrow
            [ typeArrayed $ typeEvented $ typeAttributed $ typeCtor typeName
            , typeArrayed typeNut
            ]
        $ typeNut
    , declValue element.ctor []
        $ exprApp ( exprIdent "DC.elementify2" ) [ exprString element.tag ]

    , declSignature ( un Ctor element.ctor <> "_" ) 
        $ typeArrow [ typeArrayed typeNut ]
        $ typeNut
    , declValue ( un Ctor element.ctor <> "_" ) []
        $ exprApp ( exprIdent $ un Ctor element.ctor ) [ exprIdent "empty" ]
    
    
    , declSignature ( un Ctor element.ctor <> "__" ) 
        $ typeArrow [ typeCtor "String" ]
        $ typeNut
    , declValue ( un Ctor element.ctor <> "__" ) [ binderVar "t" ]
        $ exprApp ( exprIdent $ un Ctor element.ctor <> "_" )
        [ exprArray [ exprApp ( exprIdent "DC.text_" ) [ exprIdent "t" ] ] ]
    ]
