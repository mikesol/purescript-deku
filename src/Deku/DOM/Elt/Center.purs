module Deku.DOM.Elt.Center where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Center_

center
  :: Event (Attribute Center_)
  -> Array Domable
  -> Domable
center = DC.elementify2 "center"

center_
  :: Array Domable
  -> Domable
center_ = center empty

center__
  :: String
  -> Domable
center__ t = center_ [ DC.text_ t ]
