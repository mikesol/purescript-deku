module DOM.Indexed.Values where

import Prelude
import Prim hiding (Type)

import DOM.Indexed.Common (valueName)
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Export, Role(..))
import Tidy.Codegen (declDerive, declNewtype, declRole, declSignature, declValue, exportTypeAll, exportValue, exprApp, exprCtor, exprString, typeApp, typeCtor, typeString, typeVar, typeVarKinded, typeWildcard)

type Keyword =
    { name :: String
    , value :: String
    }

exports :: Array Keyword -> Array ( Export Void )
exports keywords =
    unsafePartial $ Array.concat
        [ [ exportTypeAll "Keyword" ]
        , map ( exportValue <<< valueName <<< _.name ) keywords
        ]

generate :: Array Keyword -> Array ( Declaration Void )
generate keywords = 
    unsafePartial
    $ append 
        [ declNewtype "Keyword" [ typeVarKinded "v" $ typeCtor "Symbol" ] "Keyword" $ typeCtor "String"
        , declRole "Keyword" [ Phantom ]
        , declDerive Nothing [] "Data.Newtype.Newtype" [ typeApp ( typeCtor "Keyword" ) [ typeVar "v" ], typeWildcard ]
        ]
    $ bind keywords \{ name : srcName, value } -> do
        let name = valueName srcName
        [ declSignature name $ typeApp ( typeCtor "Keyword" ) [ typeString value ]
        , declValue name [] $ exprApp ( exprCtor "Keyword" ) [ exprString value ]
        ]
