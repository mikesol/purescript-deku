module DOM.Indexed.Values where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor)
import DOM.Indexed.Common (valueCtor)
import PureScript.CST.Types (Declaration, Export)
import Tidy.Codegen (declSignature, declValue, exportValue, exprApp, exprCtor, exprString, typeApp, typeCtor, typeString)

type Keyword =
    { ctor :: Ctor
    , value :: String
    }

exports :: Partial => Array Keyword -> Array ( Export Void )
exports keywords =
    map ( exportValue <<< valueCtor <<< _.ctor ) keywords

generate :: Partial => Array Keyword -> Array ( Declaration Void )
generate keywords = 
    bind keywords \{ ctor, value } -> do
        let name = valueCtor ctor
        [ declSignature name $ typeApp ( typeCtor "Types.Keyword" ) [ typeString value ]
        , declValue name [] $ exprApp ( exprCtor "Types.Keyword" ) [ exprString value ]
        ]
