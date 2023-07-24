module Deku.DOM.Attr.PrimitiveUnits where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Filter (Filter_)

data PrimitiveUnits = PrimitiveUnits

instance Deku.Attribute.Attr everything PrimitiveUnits Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "primitiveUnits", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Filter_ PrimitiveUnits String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "primitiveUnits", value: _ } <<<
    Deku.Attribute.prop'
