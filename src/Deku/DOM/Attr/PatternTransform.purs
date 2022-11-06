module Deku.DOM.Attr.PatternTransform where

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform String where
  attr PatternTransform value = unsafeAttribute { key: "patternTransform", value: prop' value }