module Deku.Example.Nested where

import Prelude

import Control.Alt ((<|>))
import Control.Plus (empty)
import Data.Exists (mkExists)
import Data.Foldable (for_, oneOfMap)
import Data.Int (floor)
import Data.Maybe (Maybe(..))
import Data.Tuple (Tuple(..))
import Deku.Attribute (cb, (:=))
import Deku.Control (Bus(..), blank, bus, dekuA, portal)
import Deku.Control as C
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import Effect.Random as Random
import FRP.Behavior (behavior, sample_)
import FRP.Event (Event, bang, filterMap, keepLatest, makeEvent, mapAccum, subscribe)
import FRP.Event.Time (delay, interval)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

random = behavior \e ->
  makeEvent \k -> subscribe e \f ->
    Random.random >>= k <<< f

rdm = map
  ( \{ r, g, b } -> "rgb(" <> show (floor (r * 100.0 + 155.0)) <> ","
      <> show (floor (g * 100.0 + 155.0))
      <> ","
      <> show (floor (b * 100.0 + 155.0))
      <> ")"
  )
  ({ r: _, g: _, b: _ } <$> random <*> random <*> random)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)
scene :: forall lock. Array (Element lock (FFIDOMSnapshot -> Effect Unit))
scene =
  [ D.div_ (portal
      ( D.video (bang (D.Controls := "true") <|> bang (D.Width := "250"))
          [ D.source
              ( bang
                  ( D.Src :=
                      "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.webm"
                  ) <|> bang (D.Xtype := "video/webm")
              )
              blank
          ]
      )
      ( \i -> map
          ( \rgb -> D.div (bang (D.Style := "background-color: " <> rgb <> ";"))
              i
          )
          (sample_ rdm (interval 1000))
      ))
  , D.div_
      ( map
          ( \rgb ->
              bang
                ( D.div (bang (D.Style := "background-color: " <> rgb <> ";"))
                    (C.text_ "hello")
                ) <|> delay 2000 (bang blank)
          )
          (sample_ rdm (interval 1000))
      )
  ]

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    let evt = dekuA b scene effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
