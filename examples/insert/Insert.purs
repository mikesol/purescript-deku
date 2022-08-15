module Deku.Example.Insert where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (Instant, unInstant)
import Data.Newtype (unwrap)
import Data.Tuple.Nested ((/\))
import Deku.Control (dyn_, text_)
import Deku.Core (insert, remove)
import Deku.DOM as D
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event (AnEvent, fromEvent, mapAccum, toEvent)
import FRP.Event as FRP.Event
import FRP.Event.Time as FRP.Event.Time
import Hyrule.Zora (Zora)

interval :: Int -> AnEvent Zora Instant
interval = fromEvent <<< FRP.Event.Time.interval

delay :: forall a. Int -> AnEvent Zora a -> AnEvent Zora a
delay n = fromEvent <<< FRP.Event.delay n <<< toEvent

main :: Effect Unit
main = runInBody
  ( dyn_ D.div $ map
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
          ( \x (a /\ b) ->
              if a < b then
                (((a + 1) /\ b) /\ ((unwrap (unInstant x)) /\ (a + 1)))
              else ((0 /\ (b + 1)) /\ ((unwrap (unInstant x)) /\ 0))
          )
          (interval 1000)
          (0 /\ 1)
      )
  )