module Deku.Example.SVG where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Foldable (oneOf, traverse_)
import Deku.Attribute ((!:=))
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Deku.Toplevel (hydrate, runInBody, runSSR)
import Effect (Effect)
import Graphics.Canvas (CanvasElement, fillRect, getContext2D, setFillStyle)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.HTML.HTMLCanvasElement as HTMLCanvasElement

mySVG :: Domable
mySVG = D.div_
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
  ]

myCanvas :: Domable
myCanvas = D.canvas
  ( oneOf
      [ D.Width !:= "400px"
      , D.Height !:= "400px"
      , D.Self !:= HTMLCanvasElement.fromElement >>> traverse_ \e -> do
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

scene :: Domable
scene = (Proxy :: _ "<div><h1>hi</h1>~svg~ ~canvas~</div>") ~~
  { svg: mySVG :: Domable
  , canvas: myCanvas :: Domable
  }

foreign import setBodyAs :: String -> Effect Unit

main :: Effect Unit
main =
  if false then do
    runInBody scene
  else do
    str <- liftST (runSSR scene)
    setBodyAs str
    hydrate scene

