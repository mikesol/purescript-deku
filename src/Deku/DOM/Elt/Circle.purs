module Deku.DOM.Elt.Circle where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Circle_

circle
  :: Event (Attribute Circle_)
  -> Array Domable
  -> Domable
circle = DC.elementify2 "circle"

circle_
  :: Array Domable
  -> Domable
circle_ = circle empty

circle__
  :: String
  -> Domable
circle__ t = circle_ [ DC.text_ t ]
