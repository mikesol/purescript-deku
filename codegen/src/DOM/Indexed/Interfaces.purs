module DOM.Indexed.Interfaces where

import Prelude
import Prim hiding (Type)

import DOM.Common (Ctor(..), Interface, construct)
import DOM.Indexed.Common (nominal)
import Data.Array as Array
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested (type (/\), (/\))
import PureScript.CST.Types (Declaration, Export, Type)
import Safe.Coerce (coerce)
import Tidy.Codegen (declType, exportType, typeApp, typeCtor, typeRow, typeString, typeVar, typeVarKinded)

exports :: Partial => Array Interface -> Array ( Export Void )
exports interfaces =
    Array.concat
        [ map ( exportType <<< _.name ) interfaces 
        ]

generate :: Partial => Array Interface -> Array ( Declaration Void )
generate interfaces =
    bind interfaces \{ ctor, name, bases, members } -> do
        [ declType ctor [ typeVarKinded "r" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ] ]
            $ typeIndex ( coerce bases )
            -- add an additional property to identify the interface
            $ Array.cons ( nominal /\ ( typeApp ( typeCtor "Proxy" ) [ typeString name ] ) )
            $ map (\{ index, type : t } -> index /\ construct t )
            $ Array.nub members
        ]

typeIndex :: Partial => Array String -> Array ( Ctor /\ Type Void ) -> Type Void 
typeIndex bases members =
    typeRow members $ Just $ Array.foldl (\r n -> typeApp ( typeCtor n ) [ r ] ) ( typeVar "r" ) bases
