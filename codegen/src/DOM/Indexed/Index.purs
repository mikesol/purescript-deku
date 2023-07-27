module DOM.Indexed.Index where

import Prelude
import Prim hiding (Type)

import Data.Maybe (Maybe(..))
import PureScript.CST.Types (Declaration, ImportDecl, Role(..), Type)
import Tidy.Codegen (declData, declDerive, declImportAs, declNewtype, declRole, declType, typeApp, typeCtor, typeVar, typeVarKinded, typeWildcard)

imports :: Partial => Array ( ImportDecl Void )
imports =
    [ declImportAs "Data.Newtype" [] "Data.Newtype"
    , declImportAs "Deku.Attribute" [] "Deku.Attribute"
    ]

generate :: Partial => Array ( Declaration Void )
generate =
    [ declData "Indexed" [ typeVarKinded "r" typeRowType ] []
    , declRole "Indexed" [ Phantom ]
    
    , declType "Attribute" [ typeVarKinded "r" typeRowType ]
        $ typeApp ( typeCtor "Deku.Attribute.Attribute" )
            [ typeApp ( typeCtor "Indexed" ) [ typeVar "r" ] ]

    , declNewtype "Keyword" [ typeVarKinded "v" $ typeCtor "Symbol" ] "Keyword" $ typeCtor "String"
    , declRole "Keyword" [ Phantom ]
    , declDerive Nothing [] "Data.Newtype.Newtype" [ typeApp ( typeCtor "Keyword" ) [ typeVar "v" ], typeWildcard ]
    
    ]

    where

    typeRowType :: Partial => Type Void
    typeRowType =
        typeApp ( typeCtor "Row" ) [ typeCtor "Type" ]
