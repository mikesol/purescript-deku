module Deku.DOM.Attr.Pointerdown where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointerdown = Pointerdown

instance Deku.Attribute.Attr everything Pointerdown Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerdown", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointerdown String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerdown", value: _ } <<<
    Deku.Attribute.prop'
