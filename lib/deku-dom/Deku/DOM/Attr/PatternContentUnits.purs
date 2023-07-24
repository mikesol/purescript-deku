module Deku.DOM.Attr.PatternContentUnits where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Pattern (Pattern_)

data PatternContentUnits = PatternContentUnits

instance Deku.Attribute.Attr everything PatternContentUnits Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "patternContentUnits", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Pattern_ PatternContentUnits String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "patternContentUnits", value: _ } <<<
    Deku.Attribute.prop'
