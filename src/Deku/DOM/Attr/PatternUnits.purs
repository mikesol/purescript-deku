module Deku.DOM.Attr.PatternUnits where

import Prelude

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternUnits = PatternUnits

instance Attr Pattern_ PatternUnits String where
  attr PatternUnits value = unsafeAttribute
    { key: "patternUnits", value: prop' value }

instance Attr everything PatternUnits Unit where
  attr PatternUnits _ = unsafeAttribute
    { key: "patternUnits", value: unset' }
