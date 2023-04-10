module Deku.DOM.Elt.Circle where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Circle_

circle
  :: Array (Event (Attribute Circle_))
  -> Array Nut
  -> Nut
circle = DC.elementify2 "circle"

circle_
  :: Array Nut
  -> Nut
circle_ = circle empty

circle__
  :: String
  -> Nut
circle__ t = circle_ [ DC.text_ t ]
