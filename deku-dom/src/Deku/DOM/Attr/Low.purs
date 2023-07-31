module Deku.DOM.Attr.Low where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Meter (Meter_)

data Low = Low

instance Deku.Attribute.Attr everything Low Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "low", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Meter_ Low String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "low", value: _ } <<< Deku.Attribute.prop'
