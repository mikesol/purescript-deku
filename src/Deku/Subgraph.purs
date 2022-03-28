module Deku.Subgraph where

import Prelude

import Data.Hashable (class Hashable)
import Data.Map (Map)
import Data.Maybe (Maybe(..))
import Deku.DOM as D

-- subgraph
--   :: forall index env push
--    . Hashable index
--   => Map index (Maybe env)
--   -> AsSubgraph index env push
--   -> Element dom engine
-- subgraph envs subgraphMaker =
--   Element
--     { element: Subgraph
--         { envs: F.map
--             ( \(index /\ env) ->
--                 { index
--                 , env
--                 , pos: hash index
--                 }
--             )
--             (Map.toUnfoldable envs)
--         , subgraphMaker
--         }
--     , children: {}
--     }

-- unsafeUnSubgraph
--   :: forall index env push
--    . Subgraph index env push
--   -> { | Subgraph' index env push }
-- unsafeUnSubgraph (Subgraph unsafe) = unsafe

-- type XSubgraph' index env =
--   (envs :: Array { index :: index, pos :: Int, env :: Maybe env })

-- newtype XSubgraph index env = XSubgraph { | XSubgraph' index env }

-- unsafeUnXSubgraph
--   :: forall index env
--    . XSubgraph index env
--   -> { | XSubgraph' index env }
-- unsafeUnXSubgraph (XSubgraph unsafe) = unsafe

-- xsubgraph
--   :: forall index env
--    . Hashable index
--   => Map index (Maybe env)
--   -> XSubgraph index env
-- xsubgraph envs = XSubgraph
--   { envs: F.map
--       ( \(index /\ env) ->
--           { index
--           , env
--           , pos: hash index
--           }
--       )
--       (Map.toUnfoldable envs)
--   }
