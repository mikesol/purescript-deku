module Deku.DOM.Attr.High where
import Deku.DOM.Elt.Meter(Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data High = High
instance Attr Meter_ High String where
  attr High value = unsafeAttribute { key: "high", value: prop' value }
