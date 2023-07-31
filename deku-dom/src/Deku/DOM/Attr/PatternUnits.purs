module Deku.DOM.Attr.PatternUnits where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Pattern (Pattern_)

data PatternUnits = PatternUnits

instance Deku.Attribute.Attr everything PatternUnits Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "patternUnits", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Pattern_ PatternUnits String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "patternUnits", value: _ } <<<
    Deku.Attribute.prop'
