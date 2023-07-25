module Deku.DOM.Attr.Pointerover where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Pointerover = Pointerover

instance Deku.Attribute.Attr everything Pointerover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "pointerover", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Pointerover String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "pointerover", value: _ } <<<
    Deku.Attribute.prop'
