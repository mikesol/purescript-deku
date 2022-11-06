module Deku.DOM.Attr.FilterUnits where

import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data FilterUnits = FilterUnits

instance Attr Filter_ FilterUnits String where
  attr FilterUnits value = unsafeAttribute { key: "filterUnits", value: prop' value }