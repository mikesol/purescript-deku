module Deku.Subgraph where

import Prelude

import Control.Alt ((<|>))
import Data.Hashable (class Hashable, hash)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (DOMInterpret(..), Element, Subgraph)
import FRP.Behavior (sample_)
import FRP.Event (Event, keepLatest)

data SubgraphAction env
  = InsertOrUpdate env
  | SendToTop
  | Remove

subgraph
  :: forall index env push dom engine
   . Hashable index
  => Event (index /\ SubgraphAction env)
  -> Subgraph index env push dom engine
  -> Element dom engine
subgraph
  mods
  scenes
  parent
  ( DOMInterpret
      { makeSubgraph
      , insertOrUpdateSubgraph
      , sendSubgraphToTop
      , removeSubgraph
      , ids
      }
  ) =
  keepLatest $ map
    ( \id -> pure (makeSubgraph { id, parent, scenes: scenes }) <|>
        map
          ( \(index /\ instr) -> case instr of
              Remove -> removeSubgraph { id, pos: hash index, index }
              SendToTop -> sendSubgraphToTop { id, pos: hash index, index }
              InsertOrUpdate env -> insertOrUpdateSubgraph
                { id, pos: hash index, index, env }
          )
          mods
    )
    (sample_ ids (pure unit))
