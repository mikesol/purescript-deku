module DOM.Indexed.Values where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor)
import DOM.Indexed.Common (valueCtor)
import Data.Array as Array
import PureScript.CST.Types (Declaration, Export)
import Tidy.Codegen (declSignature, declValue, exportTypeAll, exportValue, exprApp, exprCtor, exprString, typeApp, typeCtor, typeString)

type Keyword =
    { ctor :: Ctor
    , value :: String
    }

exports :: Partial => Array Keyword -> Array ( Export Void )
exports keywords =
    Array.concat
        [ [ exportTypeAll "Keyword" ]
        , map ( exportValue <<< valueCtor <<< _.ctor ) keywords
        ]

generate :: Partial => Array Keyword -> Array ( Declaration Void )
generate keywords = 
    bind keywords \{ ctor, value } -> do
        let name = valueCtor ctor
        [ declSignature name $ typeApp ( typeCtor "Keyword" ) [ typeString value ]
        , declValue name [] $ exprApp ( exprCtor "Keyword" ) [ exprString value ]
        ]
