module Deku.Example.Nested where

import Prelude

import Control.Alt ((<|>))
import Data.Foldable (for_)
import Data.Int (floor)
import Data.Tuple (Tuple(..))
import Data.Typelevel.Num (d0)
import Data.Vec ((+>))
import Data.Vec as V
import Deku.Attribute ((:=))
import Deku.Control (blank, dekuA, portal, switcher)
import Deku.Control as C
import Deku.Core (Element, Child(..))
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import Effect.Random as Random
import FRP.Behavior (Behavior, behavior, sample_)
import FRP.Event (Event, bang, makeEvent, mapAccum, subscribe)
import FRP.Event.Time (delay, interval)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

random :: Behavior Number
random = behavior \e ->
  makeEvent \k -> subscribe e \f ->
    Random.random >>= k <<< f

rdm :: Behavior String
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
  [ D.div_
      ( portal
          ( D.video (bang (D.Controls := "true") <|> bang (D.Width := "250"))
              [ D.source
                  ( bang
                      ( D.Src :=
                          "https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.webm"
                      ) <|> bang (D.Xtype := "video/webm")
                  )
                  blank
              ]
              +> V.empty
          )
          ( \i _ -> switcher
              ( \rgb -> D.div
                  (bang (D.Style := "background-color: " <> rgb <> ";"))
                  (V.index i d0)
              )
              (sample_ rdm (interval 1000))
          )
      )
  , D.div_
      ( map
          ( \rgb ->
              bang
                (Insert $ D.div (bang (D.Style := "background-color: " <> rgb <> ";"))
                    (C.text_ "hello")
                ) <|> delay 1432 (bang SendToTop) <|> delay 2000 (bang Remove)
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
