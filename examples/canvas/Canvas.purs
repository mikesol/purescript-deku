module Deku.Example.Canvas where

import Prelude

import Data.Foldable (oneOfMap, traverse_)
import Deku.Attribute ((:=))
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import FRP.Event.Class (bang)
import Graphics.Canvas (CanvasElement, fillRect, getContext2D, setFillStyle)
import Unsafe.Coerce (unsafeCoerce)
import Web.HTML.HTMLCanvasElement as HTMLCanvasElement

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
main = runInBody scene
