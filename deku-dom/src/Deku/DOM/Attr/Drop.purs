module Deku.DOM.Attr.Drop where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Drop = Drop

instance Deku.Attribute.Attr everything Drop Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "drop", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Drop String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "drop", value: _ } <<< Deku.Attribute.prop'
