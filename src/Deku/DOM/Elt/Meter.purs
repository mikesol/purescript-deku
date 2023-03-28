module Deku.DOM.Elt.Meter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable)
import FRP.Event (Event)

data Meter_

meter
  :: Event (Attribute Meter_)
  -> Array Domable
  -> Domable
meter = DC.elementify2 "meter"

meter_
  :: Array Domable
  -> Domable
meter_ = meter empty

meter__
  :: String
  -> Domable
meter__ t = meter_ [ DC.text_ t ]
