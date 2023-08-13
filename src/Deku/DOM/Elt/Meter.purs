module Deku.DOM.Elt.Meter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Nut)
import FRP.Poll (Poll)

data Meter_

meter
  :: Array (Poll (Attribute Meter_))
  -> Array Nut
  -> Nut
meter = DC.elementify2 "meter"

meter_
  :: Array Nut
  -> Nut
meter_ = meter empty

meter__
  :: String
  -> Nut
meter__ t = meter_ [ DC.text_ t ]
