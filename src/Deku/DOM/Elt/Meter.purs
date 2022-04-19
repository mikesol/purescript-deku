module Deku.DOM.Elt.Meter where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Element)
import FRP.Event (class IsEvent)

data Meter_

meter
  :: forall event payload
   . IsEvent event
  => event (Attribute Meter_)
  -> Array (Element event payload)
  -> Element event payload
meter = elementify "meter"

meter_
  :: forall event payload
   . IsEvent event
  => Array (Element event payload)
  -> Element event payload
meter_ = meter empty
