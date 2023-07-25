module Deku.DOM.Attr.Slotchange where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Slotchange = Slotchange

instance Deku.Attribute.Attr everything Slotchange Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "slotchange", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Slotchange String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "slotchange", value: _ } <<<
    Deku.Attribute.prop'
