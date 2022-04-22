module Deku.Example.Canvas where

import Prelude

import Control.Plus (empty)
import Data.Exists (mkExists)
import Data.Foldable (for_, oneOfMap)
import Data.Tuple (Tuple(..))
import Deku.Attribute ((:=))
import Deku.Control (Bus(..), bus, deku, deku2, flatten)
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

scene :: forall lock. Element lock (FFIDOMSnapshot -> Effect Unit)
scene = D.canvas
  ( oneOfMap bang
      [ D.Width := "400px"
      , D.Height := "400px"
      , D.Draw2D := \ctx -> do
          setFillStyle ctx "blue"
          fillRect ctx { height: 100.0, width: 100.0, x: 0.0, y: 0.0 }
      ]
  )
  (empty :: Event (Element lock (FFIDOMSnapshot -> Effect Unit)))

main :: Effect Unit
main = do
  b' <- window >>= document >>= body
  for_ (toElement <$> b') \b -> do
    ffi <- makeFFIDOMSnapshot
    let evt = deku2 b scene effectfulDOMInterpret
    void $ subscribe evt \i -> i ffi
