module Deku.DOM.Elt.Map where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Map_

map
  :: Event (Attribute Map_)
  -> Array Domable
  -> Domable
map = DC.elementify2 "map"

map_
  :: Array Domable
  -> Domable
map_ = map empty

map__
  :: String
  -> Domable
map__ t = map_ [ DC.text_ t ]
