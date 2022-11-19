module Deku.Example.SVG where

import Prelude

import Control.Monad.ST.Class (liftST)
import Data.Foldable (oneOf)
import Deku.Attribute ((!:=))
import Deku.Core (Domable)
import Deku.DOM as D
import Deku.Pursx ((~~))
import Deku.Toplevel (Template(..), hydrate, runInBody, runSSR)
import Effect (Effect)
import Type.Proxy (Proxy(..))

mySVG :: forall lock payload. Domable lock payload
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

scene :: forall lock payload. Domable lock payload
scene = (Proxy :: _ "<div><h1>hi</h1>~svg~</div>") ~~ {svg: mySVG :: Domable lock payload}

foreign import setBodyAs :: String -> Effect Unit

main :: Effect Unit
main =
  if false then do
    runInBody scene
  else do
    str <- liftST (runSSR (Template { head: "", tail: ""}) scene)
    setBodyAs str
    hydrate scene

    