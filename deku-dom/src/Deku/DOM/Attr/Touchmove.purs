module Deku.DOM.Attr.Touchmove where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Touchmove = Touchmove

instance Deku.Attribute.Attr everything Touchmove Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "touchmove", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Touchmove String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchmove", value: _ } <<<
    Deku.Attribute.prop'
