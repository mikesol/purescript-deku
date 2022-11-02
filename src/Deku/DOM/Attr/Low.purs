module Deku.DOM.Attr.Low where

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Low = Low

instance Attr Meter_ Low String where
  attr Low value = unsafeAttribute { key: "low", value: prop' value }
