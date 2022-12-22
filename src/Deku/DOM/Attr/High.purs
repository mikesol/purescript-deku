module Deku.DOM.Attr.High where

import Prelude

import Deku.DOM.Elt.Meter (Meter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data High = High

instance Attr Meter_ High String where
  attr High value = unsafeAttribute { key: "high", value: prop' value }

instance Attr everything High Unit where
  attr High _ = unsafeAttribute
    { key: "high", value: unset' }
