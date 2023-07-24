module Deku.DOM.Attr.High where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Meter (Meter_)

data High = High

instance Deku.Attribute.Attr everything High Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "high", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Meter_ High String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "high", value: _ } <<< Deku.Attribute.prop'
