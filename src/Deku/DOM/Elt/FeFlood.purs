module Deku.DOM.Elt.FeFlood where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data FeFlood_

feFlood
  :: Event (Attribute FeFlood_)
  -> Array Domable
  -> Domable
feFlood = DC.elementify2 "feFlood"

feFlood_
  :: Array Domable
  -> Domable
feFlood_ = feFlood empty

feFlood__
  :: String
  -> Domable
feFlood__ t = feFlood_ [ DC.text_ t ]
