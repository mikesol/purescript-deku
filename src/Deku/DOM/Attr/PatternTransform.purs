module Deku.DOM.Attr.PatternTransform where

import Prelude

import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PatternTransform = PatternTransform

instance Attr Pattern_ PatternTransform String where
  attr PatternTransform value = unsafeAttribute
    { key: "patternTransform", value: prop' value }

instance Attr everything PatternTransform Unit where
  attr PatternTransform _ = unsafeAttribute
    { key: "patternTransform", value: unset' }
