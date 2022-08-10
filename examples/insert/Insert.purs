module Deku.Example.Insert where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (unInstant)
import Data.Newtype (unwrap)
import Data.Tuple.Nested ((/\))
import Deku.Control (dyn_, text_)
import Deku.Core (insert, remove)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (delay, mapAccum)
import FRP.Event.Time (interval)

main :: Effect Unit
main = runInBody
  ( dyn_ D.div $ map
      ( \(x /\ c) ->
          ( pure (insert c (D.div_ [text_ ("At pos: " <> show c <> " at time " <> show x)])) <|> delay (5050 + (c * 1000)) (pure remove)
          )
      )
      ( mapAccum
          ( \x (a /\ b) ->
              if a < b then (((a + 1) /\ b) /\ ((unwrap (unInstant x)) /\ (a + 1)))
              else ((0 /\ (b + 1)) /\ ((unwrap (unInstant x)) /\ 0))
          )
          (interval 1000)
          (0 /\ 1)
      )
  )