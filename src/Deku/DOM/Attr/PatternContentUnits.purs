module Deku.DOM.Attr.PatternContentUnits where

import Prelude

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternContentUnits = PatternContentUnits

instance Attr Pattern_ PatternContentUnits String where
  attr PatternContentUnits value = unsafeAttribute
    { key: "patternContentUnits", value: prop' value }

instance Attr everything PatternContentUnits Unit where
  attr PatternContentUnits _ = unsafeAttribute
    { key: "patternContentUnits", value: unset' }
