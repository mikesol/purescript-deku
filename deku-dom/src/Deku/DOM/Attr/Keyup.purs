module Deku.DOM.Attr.Keyup where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Keyup = Keyup

instance Deku.Attribute.Attr everything Keyup Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "keyup", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Keyup String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "keyup", value: _ } <<< Deku.Attribute.prop'
