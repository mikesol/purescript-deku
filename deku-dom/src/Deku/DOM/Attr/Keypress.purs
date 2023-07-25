module Deku.DOM.Attr.Keypress where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Keypress = Keypress

instance Deku.Attribute.Attr everything Keypress Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keypress", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Keypress String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keypress", value: _ } <<< Deku.Attribute.prop'
