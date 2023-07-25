module Deku.DOM.Elt.Canvas where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Canvas_

canvas :: Array (FRP.Event.Event (Deku.Attribute.Attribute Canvas_)) -> Array Nut -> Nut
canvas = DC.elementify2 "canvas"

canvas_ :: Array Nut -> Nut
canvas_ = canvas empty

canvas__ :: String -> Nut
canvas__ t = canvas_ [ DC.text_ t ]
