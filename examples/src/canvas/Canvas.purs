module Deku.Example.SVG where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Foldable (traverse_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.Attributes as DA
import Deku.DOM.SVG as SVG
import Deku.DOM.SVG.Attributes as SA
import Deku.DOM.Self as Self
import Deku.Pursx ((~~))
import Deku.Toplevel (hydrate, runInBody, runSSR)
import Effect (Effect)
import Graphics.Canvas (CanvasElement, fillRect, getContext2D, setFillStyle)
import Type.Proxy (Proxy(..))
import Unsafe.Coerce (unsafeCoerce)
import Web.HTML.HTMLCanvasElement as HTMLCanvasElement

mySVG :: Nut
mySVG = D.div_
  [ SVG.svg [ DA.height_ "100", DA.width_ "100" ]
      [ SVG.circle
          [ SA.cx_ "50"
          , SA.cy_ "50"
          , SA.r_ "40"
          , SA.stroke_ "black"
          , SA.strokeWidth_ "3"
          , SA.fill_ "red"
          ]
      
          []
      ]
  ]

myCanvas :: Nut
myCanvas = D.canvas
  [ DA.width_ "400px"
  , DA.height_ "400px"
  , Self.self_ $ HTMLCanvasElement.fromElement >>> traverse_ \e -> do
      ctx <- getContext2D
        ( ( unsafeCoerce
              :: HTMLCanvasElement.HTMLCanvasElement -> CanvasElement
          ) e
        )
      setFillStyle ctx "blue"
      fillRect ctx { height: 100.0, width: 100.0, x: 0.0, y: 0.0 }
  ]
  []

scene :: Nut
scene = (Proxy :: _ "<div><h1>hi</h1>~svg~ ~canvas~</div>") ~~
  { svg: mySVG :: Nut
  , canvas: myCanvas :: Nut
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

