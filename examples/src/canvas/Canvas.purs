module Deku.Example.SVG where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Foldable (traverse_)
import Deku.Core (Nut)
import Deku.DOM as D
import Deku.DOM.SVG as SVG
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
  [ SVG.svg [ D._height_ "100", D._width_ "100" ]
      [ SVG.circle
          [ SVG._cx_ "50"
          , SVG._cy_ "50"
          , SVG._r_ "40"
          , SVG._stroke_ "black"
          , SVG._strokeWidth_ "3"
          , SVG._fill_ "red"
          ]
      
          []
      ]
  ]

myCanvas :: Nut
myCanvas = D.canvas
  [ D._width_ "400px"
  , D._height_ "400px"
  , Self._self_ $ HTMLCanvasElement.fromElement >>> traverse_ \e -> do
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

