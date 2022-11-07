module Deku.Example.Canvas where

import Prelude

import Data.Foldable (oneOf, oneOfMap, traverse_)
import Deku.Attribute ((!:=), (:=))
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Interpret (FFIDOMSnapshot)
import Deku.Toplevel (runInBody)
import Effect (Effect)
import Graphics.Canvas (CanvasElement, fillRect, getContext2D, setFillStyle)
import Unsafe.Coerce (unsafeCoerce)
import Web.HTML.HTMLCanvasElement as HTMLCanvasElement

scene :: forall lock. Domable lock (FFIDOMSnapshot -> Effect Unit)
scene = D.div_
  [ D.svg (oneOf [ D.Height !:= "100", D.Width !:= "100" ])
      [ D.circle
          ( oneOf
              [ D.Cx !:= "50"
              , D.Cy !:= "50"
              , D.R !:= "40"
              , D.Stroke !:= "black"
              , D.StrokeWidth !:= "3"
              , D.Fill !:= "red"
              ]
          )
          []
      ]
  , D.canvas
      ( oneOfMap pure
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
  ]

main :: Effect Unit
main = runInBody scene
