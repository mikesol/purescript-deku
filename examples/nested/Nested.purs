module Deku.Example.Nested where

import Prelude

import Control.Alt ((<|>))
import Data.DateTime.Instant (Instant)
import Data.FastVect.FastVect ((:))
import Data.FastVect.FastVect as V
import Data.Int (floor)
import Data.Monoid.Additive (Additive(..))
import Data.Tuple (Tuple(..))
import Deku.Attribute ((:=))
import Deku.Control (dyn_, portal, switcher_)
import Deku.Control as C
import Deku.Core (Domable, insert_, remove, sendToTop)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Toplevel (runInBodyA)
import Effect (Effect)
import Effect.Random as Random
import FRP.Behavior (ABehavior, behavior, sample_)
import FRP.Event (AnEvent, fromEvent, makeEvent, mapAccum, subscribe, toEvent)
import FRP.Event as FRP.Event
import FRP.Event.Time as FRP.Event.Time
import Hyrule.Zora (Zora, liftImpure)
import Type.Prelude (Proxy(..))

interval :: Int -> AnEvent Zora Instant
interval = fromEvent <<< FRP.Event.Time.interval

delay :: forall a. Int -> AnEvent Zora a -> AnEvent Zora a
delay n = fromEvent <<< FRP.Event.delay n <<< toEvent

-- random :: ABehavior Zora (Additive Number)
random :: ABehavior (AnEvent Zora) (Additive Number)
random = behavior \e ->
  makeEvent \k -> subscribe e \f ->
    (liftImpure $ Additive <$> Random.random) >>= k <<< f

-- rdm :: ABehavior Zora String
rdm :: ABehavior (AnEvent Zora) String
rdm = map
  ( \{ r: Additive r, g: Additive g, b: Additive b } -> "rgb(" <> show (floor (r * 100.0 + 155.0)) <> ","
      <> show (floor (g * 100.0 + 155.0))
      <> ","
      <> show (floor (b * 100.0 + 155.0))
      <> ")"
  )
  ({ r: _, g: _, b: _ } <$> random <*> random <*> random)

counter :: forall a. AnEvent Zora a → AnEvent Zora (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)

scene
  :: forall lock. Array (Domable lock (FFIDOMSnapshot -> Effect Unit))
scene =
  [ D.div_
      [ portal
          ( D.video (pure (D.Controls := "true") <|> pure (D.Width := "250"))
              [ D.source
                  ( pure
                      ( D.Src :=
                          "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.webm"
                      ) <|> pure (D.Xtype := "video/webm")
                  )
                  []
              ]
              : V.empty
          )
          ( \i _ -> switcher_ D.div
              ( \rgb -> D.div
                  (pure (D.Style := "background-color: " <> rgb <> ";"))
                  [ V.index (Proxy :: _ 0) i ]
              )
              (sample_ rdm (interval 1000))              
          )
      ]
  , dyn_ D.div $ map
      ( \rgb ->
          pure
            ( insert_ $ D.div
                (pure (D.Style := "background-color: " <> rgb <> ";"))
                [ C.text_ "hello" ]
            ) <|> delay 1432 (pure sendToTop) <|> delay 2000 (pure remove)
      )
      (sample_ rdm (interval 1000))
  ]

main :: Effect Unit
main = runInBodyA scene
