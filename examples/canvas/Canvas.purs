module Deku.Example.Canvas where

import Prelude

import Data.Foldable (for_, oneOfMap)
import Data.Tuple (Tuple(..))
import Deku.Attribute ((:=))
import Deku.Control (deku, flatten)
import Deku.Core (Element)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (Event, create, mapAccum, subscribe)
import FRP.Event.Class (bang)
import Graphics.Canvas (fillRect, setFillStyle)
import Web.HTML (window)
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

counter :: forall a. Event a → Event (Tuple a Int)
counter event = mapAccum f event 0
  where
  f a b = Tuple (b + 1) (Tuple a b)
scene
  :: (Boolean -> Effect Unit)
  -> Event Boolean
  -> Element Event (FFIDOMSnapshot -> Effect Unit)
scene _ _ =
  flatten
    [ D.canvas
        ( oneOfMap bang
            [ D.Width := "400px"
            , D.Height := "400px"
            , D.Draw2D := \ctx -> do
              setFillStyle ctx "blue"
              fillRect ctx { height: 100.0, width: 100.0, x: 0.0, y: 0.0 }
            ]
        )
        []
    ]

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    { push, event } <- create
    let evt = deku b (scene push event) effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
    push true
