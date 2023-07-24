module Deku.DOM.Attr.Role where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Role = Role

instance Deku.Attribute.Attr everything Role Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "role", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Role String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "role", value: _ } <<< Deku.Attribute.prop'
