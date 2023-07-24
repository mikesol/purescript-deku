module Deku.DOM.Attr.PatternTransform where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Pattern (Pattern_)

data PatternTransform = PatternTransform

instance Deku.Attribute.Attr everything PatternTransform Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "patternTransform", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Pattern_ PatternTransform String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "patternTransform", value: _ } <<<
    Deku.Attribute.prop'
