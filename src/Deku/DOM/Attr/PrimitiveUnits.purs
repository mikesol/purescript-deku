module Deku.DOM.Attr.PrimitiveUnits where

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PrimitiveUnits = PrimitiveUnits

instance Attr Filter_ PrimitiveUnits String where
  attr PrimitiveUnits value = unsafeAttribute
    { key: "primitiveUnits", value: prop' value }