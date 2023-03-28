module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Canvas_

canvas
  :: Event (Attribute Canvas_)
  -> Array Domable
  -> Domable
canvas = DC.elementify2 "canvas"

canvas_
  :: Array Domable
  -> Domable
canvas_ = canvas empty

canvas__
  :: String
  -> Domable
canvas__ t = canvas_ [ DC.text_ t ]
