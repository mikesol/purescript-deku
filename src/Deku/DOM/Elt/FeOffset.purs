module Deku.DOM.Elt.FeOffset where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data FeOffset_

feOffset
  :: Array (Poll (Attribute FeOffset_))
  -> Array Nut
  -> Nut
feOffset = DC.elementify2 "feOffset"

feOffset_
  :: Array Nut
  -> Nut
feOffset_ = feOffset empty

feOffset__
  :: String
  -> Nut
feOffset__ t = feOffset_ [ DC.text t ]
