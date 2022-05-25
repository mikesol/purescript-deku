module Deku.DOM.Attr.Min where

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Min = Min

instance Attr Input_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }

instance Attr Meter_ Min String where
  attr Min value = unsafeAttribute { key: "min", value: prop' value }
