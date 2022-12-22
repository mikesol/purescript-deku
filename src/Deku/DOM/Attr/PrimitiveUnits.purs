module Deku.DOM.Attr.PrimitiveUnits where

import Prelude

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PrimitiveUnits = PrimitiveUnits

instance Attr Filter_ PrimitiveUnits String where
  attr PrimitiveUnits value = unsafeAttribute
    { key: "primitiveUnits", value: prop' value }

instance Attr everything PrimitiveUnits Unit where
  attr PrimitiveUnits _ = unsafeAttribute
    { key: "primitiveUnits", value: unset' }
