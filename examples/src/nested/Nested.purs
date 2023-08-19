module Deku.Example.Nested where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (Instant)
import Data.FastVect.FastVect ((:))
import Data.FastVect.FastVect as V
import Data.Int (floor)
import Data.Monoid.Additive (Additive(..))
import Data.Tuple (Tuple(..))
import Deku.Control (portal, switcher)
import Deku.Control as C
import Deku.Core (Nut, dyn, fixed, insert_, remove, sendToTop)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Effect.Random as Random
import FRP.Behavior (ABehavior, behavior, sample_)
import FRP.Event (Event, makeEvent, mapAccum, subscribe)
import FRP.Event as FRP.Event
import FRP.Event.Time as FRP.Event.Time
import Type.Prelude (Proxy(..))

interval :: Int -> Event Instant
interval = FRP.Event.Time.interval

delay :: forall a. Int -> Event a -> Event a
delay n = FRP.Event.delay n

random :: ABehavior (Event) (Additive Number)
random = behavior \e ->
  makeEvent \k -> subscribe e \f ->
    (Additive <$> Random.random) >>= k <<< f

rdm :: ABehavior (Event) String
rdm = map
  ( \{ r: Additive r, g: Additive g, b: Additive b } -> "rgb("
      <> show (floor (r * 100.0 + 155.0))
      <> ","
      <> show (floor (g * 100.0 + 155.0))
      <> ","
      <> show (floor (b * 100.0 + 155.0))
      <> ")"
  )
  ({ r: _, g: _, b: _ } <$> random <*> random <*> random)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f 0 event
  where
  f a b = Tuple (a + 1) (Tuple b a)

scene :: Array Nut
scene =
  [ D.div_
      [ portal
          ( D.video [ DA.controls_ "true", DA.width_ "250"]
              [ D.source
                  [ DA.src_ "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.webm"
                  , DA.xtype_ "video/webm"
                  ]
                  []
              ]
              : V.empty
          )
          ( \i -> switcher
              ( \rgb -> D.div
                  [ DA.style_ $ "background-color: " <> rgb <> ";" ]
                  [ V.index (Proxy :: _ 0) i ]
              )
              (sample_ rdm (interval 1000))
          )
      ]
  , dyn $ map
      ( \rgb ->
          pure
            ( insert_ $ D.div
                [ DA.style_ $ "background-color: " <> rgb <> ";" ]
                [ C.text_ "hello" ]
            ) <|> delay 1432 (pure sendToTop) <|> delay 2000 (pure remove)
      )
      (sample_ rdm (interval 1000))
  ]

main :: Effect Unit
main = runInBody (fixed scene)
