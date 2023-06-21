module Deku.DOM.Elt.FeOffset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Event (Event)

import Deku.DOM.Tags as Tags

feOffset
  :: Array (Event (Attribute Tags.FeOffset_))
  -> Array Nut
  -> Nut
feOffset = DC.elementify3 "feOffset"

feOffset_
  :: Array Nut
  -> Nut
feOffset_ = feOffset empty

feOffset__
  :: String
  -> Nut
feOffset__ t = feOffset_ [ DC.text_ t ]
