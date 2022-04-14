module Deku.Subgraph where

import Prelude

import Control.Alt ((<|>))
import Data.Hashable (class Hashable, hash)
import Data.Tuple.Nested (type (/\), (/\))
import Deku.Core (DOMInterpret(..), Element(..), Subgraph)
import FRP.Behavior (sample_)
import FRP.Event (class IsEvent, keepLatest)
import FRP.Event.Class (bang)

data SubgraphAction
  = Insert
  | SendToTop
  | Remove

subgraph
  :: forall index event payload
   . Hashable index
  => IsEvent event
  => event (index /\ SubgraphAction)
  -> Subgraph index event payload
  -> Element event payload
subgraph mods scenes = Element go
  where
  go
    parent
    ( DOMInterpret
        { makeSubgraph
        , insertSubgraph
        , sendSubgraphToTop
        , removeSubgraph
        , ids
        }
    ) =
    keepLatest $ map
      ( \id -> bang (makeSubgraph { id, parent, scenes: scenes }) <|>
          map
            ( \(index /\ instr) -> case instr of
                Remove -> removeSubgraph { id, pos: hash index, index }
                SendToTop -> sendSubgraphToTop { id, pos: hash index, index }
                Insert -> insertSubgraph
                  { id, pos: hash index, index }
            )
            mods
      )
      (sample_ ids (bang unit))

infixr 6 subgraph as @@