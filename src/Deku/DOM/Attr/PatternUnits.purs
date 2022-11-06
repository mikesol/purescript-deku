module Deku.DOM.Attr.PatternUnits where

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PatternUnits = PatternUnits

instance Attr Pattern_ PatternUnits String where
  attr PatternUnits value = unsafeAttribute { key: "patternUnits", value: prop' value }