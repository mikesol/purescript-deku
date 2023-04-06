module Deku.DOM.Elt.Map where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Map_

map
  :: Array (Event (Attribute Map_))
  -> Array Nut
  -> Nut
map = DC.elementify2 "map"

map_
  :: Array Nut
  -> Nut
map_ = map empty

map__
  :: String
  -> Nut
map__ t = map_ [ DC.text_ t ]
