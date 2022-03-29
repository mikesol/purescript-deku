module Deku.Subgraph where

import Prelude

import Control.Alt ((<|>))
import Data.Hashable (class Hashable, hash)
import Data.Map (Map, toUnfoldable)
import Data.Maybe (Maybe)
import Data.Tuple.Nested ((/\))
import Deku.Core (DOMInterpret(..), Element, Subgraph)
import FRP.Behavior (sample_)
import FRP.Event (Event, keepLatest)

subgraph
  :: forall index env push dom engine
   . Hashable index
  => Event (Map index (Maybe env))
  -> Subgraph index env push dom engine
  -> Element dom engine
subgraph envs scenes parent (DOMInterpret { makeSubgraph, setSubgraph, ids }) =
  keepLatest $ map
    ( \id -> pure (makeSubgraph { id, parent, scenes: scenes }) <|>
        ( envs <#> \envs' -> setSubgraph
            { id
            , envs: map (\(a /\ b) -> { pos: hash a, index: a, env: b })
                (toUnfoldable envs')
            }
        )
    )
    (sample_ ids (pure unit))
