module Deku.DOM.Elt.FeFlood where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feFlood
  :: Array (Event (Attribute Tags.FeFlood_))
  -> Array Nut
  -> Nut
feFlood = DC.elementify3 "feFlood"

feFlood_
  :: Array Nut
  -> Nut
feFlood_ = feFlood empty

feFlood__
  :: String
  -> Nut
feFlood__ t = feFlood_ [ DC.text_ t ]
