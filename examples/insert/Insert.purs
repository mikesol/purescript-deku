module Deku.Example.Insert where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (Instant, unInstant)
import Data.Newtype (unwrap)
import Data.Tuple.Nested ((/\))
import Deku.Control (text_)
import Deku.Core (insert, dyn, remove)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (Event, mapAccum)
import FRP.Event as FRP.Event
import FRP.Event.Time as FRP.Event.Time


interval :: Int -> Event Instant
interval = FRP.Event.Time.interval

delay :: forall a. Int -> Event a -> Event a
delay n = FRP.Event.delay n

main :: Effect Unit
main = runInBody
  ( dyn $ map
      ( \(x /\ c) ->
          ( pure
              ( insert c
                  ( D.div_
                      [ text_ ("At pos: " <> show c <> " at time " <> show x) ]
                  )
              ) <|> delay (5050 + (c * 1000)) (pure remove)
          )
      )
      ( mapAccum
          ( \(a /\ b) x ->
              if a < b then
                (((a + 1) /\ b) /\ ((unwrap (unInstant x)) /\ (a + 1)))
              else ((0 /\ (b + 1)) /\ ((unwrap (unInstant x)) /\ 0))
          )
          (0 /\ 1)
          (interval 1000)
      )
  )