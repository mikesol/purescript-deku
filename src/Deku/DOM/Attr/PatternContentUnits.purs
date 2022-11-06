module Deku.DOM.Attr.PatternContentUnits where

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PatternContentUnits = PatternContentUnits

instance Attr Pattern_ PatternContentUnits String where
  attr PatternContentUnits value = unsafeAttribute
    { key: "patternContentUnits", value: prop' value }