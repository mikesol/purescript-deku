module Deku.DOM.Elt.Polyline where

import Control.Plus (empty)
import Deku.Attribute as Deku.Attribute
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event as FRP.Event

data Polyline_

polyline :: Array (FRP.Event.Event (Deku.Attribute.Attribute Polyline_)) -> Array Nut -> Nut
polyline = DC.elementify2 "polyline"

polyline_ :: Array Nut -> Nut
polyline_ = polyline empty

polyline__ :: String -> Nut
polyline__ t = polyline_ [ DC.text_ t ]
