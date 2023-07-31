module Deku.DOM.Attr.Popover where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Popover = Popover

instance Deku.Attribute.Attr everything Popover Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "popover", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Popover String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "popover", value: _ } <<< Deku.Attribute.prop'
