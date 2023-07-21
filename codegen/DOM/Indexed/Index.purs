module DOM.Indexed.Index where

import Prelude

import Data.Maybe (Maybe(..))
import PureScript.CST.Types (Declaration, ImportDecl, Role(..))
import Tidy.Codegen (declData, declDerive, declImportAs, declNewtype, declRole, typeApp, typeCtor, typeVar, typeVarKinded, typeWildcard)

imports :: Partial => Array ( ImportDecl Void )
imports =
    [ declImportAs "Data.Newtype" [] "Data.Newtype"
    ]

generate :: Partial => Array ( Declaration Void )
generate =
    [ declData "Indexed" [ typeVarKinded "r" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ] ] []
    , declRole "Indexed" [ Phantom ]
    , declNewtype "Keyword" [ typeVarKinded "v" $ typeCtor "Symbol" ] "Keyword" $ typeCtor "String"
    , declRole "Keyword" [ Phantom ]
    , declDerive Nothing [] "Data.Newtype.Newtype" [ typeApp ( typeCtor "Keyword" ) [ typeVar "v" ], typeWildcard ]
    ]
