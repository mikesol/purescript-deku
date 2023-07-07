module DOM.Indexed.Interfaces where

import Prelude
import Prim hiding (Type)

import DOM.Indexed.Common (attributeMember, construct, escape, mapType, nominal)
import DOM.Spec (Interface)
import Data.Array as Array
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Traversable (traverse)
import Data.Tuple.Nested (type (/\), (/\))
import Foreign.Object as Foreign
import Partial.Unsafe (unsafePartial)
import PureScript.CST.Types (Declaration, Export, Role(..), Type)
import Tidy.Codegen (declData, declRole, declType, exportType, exportTypeAll, typeApp, typeCtor, typeRow, typeString, typeVar, typeVarKinded)

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

declInterface
    :: Partial
    => Foreign.Object ( Interface /\ Array String )
    -> Array ( Declaration Void )
declInterface interfaces =
    bind ( Foreign.toUnfoldable interfaces ) \( rawName /\ ( interface /\ bases ) ) -> do
        let name = escape rawName
        [ declType name [ typeVarKinded "r" $ typeApp ( typeCtor "Row" ) [ typeCtor "Type" ] ]
            $ typeIndex bases
            -- add an additional property to identify the interface
            $ Array.cons ( nominal /\ ( typeApp ( typeCtor "Proxy" ) [ typeString rawName ] ) )
            $ map ( map construct )
            $ Array.nub
            $ bind
                ( fromMaybe [] interface.members )
                ( traverse ( map _.type <<< mapType ) <=< attributeMember )
        ]

typeIndex :: Array String -> Array ( String /\ Type Void ) -> Type Void 
typeIndex bases members =
    unsafePartial
        $ typeRow members
        $ Just $ Array.foldl (\r n -> typeApp ( typeCtor n ) [ r ] ) ( typeVar "r" ) bases