module Deku.DOM.Attr.Keydown where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Keydown = Keydown

instance Deku.Attribute.Attr everything Keydown Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keydown", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Keydown String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keydown", value: _ } <<< Deku.Attribute.prop'
