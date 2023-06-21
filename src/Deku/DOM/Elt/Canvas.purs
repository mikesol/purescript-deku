module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

canvas
  :: Array (Event (Attribute Tags.Canvas_))
  -> Array Nut
  -> Nut
canvas = DC.elementify3 "canvas"

canvas_
  :: Array Nut
  -> Nut
canvas_ = canvas empty

canvas__
  :: String
  -> Nut
canvas__ t = canvas_ [ DC.text_ t ]
