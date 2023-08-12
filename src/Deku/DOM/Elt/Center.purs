module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

data Center_

center
  :: Array (Event (Attribute Center_))
  -> Array Nut
  -> Nut
center = DC.elementify2 "center"

center_
  :: Array Nut
  -> Nut
center_ = center empty

center__
  :: String
  -> Nut
center__ t = center_ [ DC.text_ t ]
