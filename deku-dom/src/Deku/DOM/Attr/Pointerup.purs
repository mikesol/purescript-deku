module Deku.DOM.Attr.Pointerup where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointerup = Pointerup

instance Deku.Attribute.Attr everything Pointerup Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerup", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointerup String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerup", value: _ } <<<
    Deku.Attribute.prop'
