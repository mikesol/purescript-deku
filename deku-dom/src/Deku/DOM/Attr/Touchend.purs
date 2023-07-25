module Deku.DOM.Attr.Touchend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Touchend = Touchend

instance Deku.Attribute.Attr everything Touchend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "touchend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Touchend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "touchend", value: _ } <<< Deku.Attribute.prop'
