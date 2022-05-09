module Deku.Example.Canvas where

import Prelude

import Data.Foldable (for_, oneOfMap, traverse_)
import Deku.Attribute ((:=))
import Deku.Control (deku)
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot, effectfulDOMInterpret, makeFFIDOMSnapshot)
import Effect (Effect)
import FRP.Event (subscribe)
import FRP.Event.Class (bang)
import Graphics.Canvas (CanvasElement, fillRect, getContext2D, setFillStyle)
import Unsafe.Coerce (unsafeCoerce)
import Web.HTML (window)
import Web.HTML.HTMLCanvasElement as HTMLCanvasElement
import Web.HTML.HTMLDocument (body)
import Web.HTML.HTMLElement (toElement)
import Web.HTML.Window (document)

scene :: forall lock. Domable Effect lock (FFIDOMSnapshot -> Effect Unit)
scene = D.canvas
  ( oneOfMap bang
      [ D.Width := "400px"
      , D.Height := "400px"
      , D.Self := HTMLCanvasElement.fromElement >>> traverse_ \e -> do
          ctx <- getContext2D
            ( ( unsafeCoerce
                  :: HTMLCanvasElement.HTMLCanvasElement -> CanvasElement
              ) e
            )
          setFillStyle ctx "blue"
          fillRect ctx { height: 100.0, width: 100.0, x: 0.0, y: 0.0 }
      ]
  )
  []

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    let evt = deku b scene effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
