module DOM.Indexed.Interfaces where

import Prelude
import Prim hiding (Type)

import DOM.Indexed.Common (AttributeType, attributeMember, construct, escape, mapType)
import DOM.Spec (Interface)
import Data.Array as Array
import Data.Function (on)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Traversable (traverse)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Export, Role(..), Type)
import Tidy.Codegen (declData, declRole, declType, exportType, exportTypeAll, typeApp, typeCtor, typeRow, typeVar, typeVarKinded)

exports :: Foreign.Object ( Interface /\ Array String ) -> Array ( Export Void )
exports interfaces =
    unsafePartial $ Array.concat
        [ [ exportTypeAll "Indexed" ]
        , flip map ( Foreign.toUnfoldable interfaces ) \( rawName /\ _ ) ->
            exportType $ escape rawName
        ]

generate :: Foreign.Object ( Interface /\ Array String ) -> Array ( Declaration Void )
generate interfaces =
    unsafePartial
        $ append declCommon
        $ declInterface interfaces

declCommon :: Partial => Array ( Declaration Void )
declCommon =
    [ declData "Indexed" [ typeVarKinded "r" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ] ] []
    , declRole "Indexed" [ Phantom ]
    ]

declInterface :: Partial => Foreign.Object ( Interface /\ Array String ) -> Array ( Declaration Void )
declInterface interfaces =
    bind ( Foreign.toUnfoldable interfaces ) \( rawName /\ ( interface /\ bases ) ) -> do
        let name = escape rawName
        [ declType name [ typeVarKinded "r" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ] ]
            $ typeIndex bases
            $ Array.nubBy ( compare `on` (\( n /\ t ) -> n /\ t.type ) )
            $ bind ( fromMaybe [] interface.members ) ( traverse mapType <=< attributeMember )
        ]

typeIndex :: Array String -> Array ( String /\ AttributeType ) -> Type Void 
typeIndex bases members =
    unsafePartial
        $ typeRow ( map ( construct <<< _.type ) <$> members )
        $ Just $ Array.foldl (\r n -> typeApp ( typeCtor n ) [ r ] ) ( typeVar "r" ) bases