module Deku.DOM.Attr.Slot where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Slot = Slot

instance Deku.Attribute.Attr everything Slot Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "slot", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Slot String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "slot", value: _ } <<< Deku.Attribute.prop'
