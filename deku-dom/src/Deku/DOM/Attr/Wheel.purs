module Deku.DOM.Attr.Wheel where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Wheel = Wheel

instance Deku.Attribute.Attr everything Wheel Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "wheel", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Wheel String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "wheel", value: _ } <<< Deku.Attribute.prop'
