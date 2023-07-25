module Deku.DOM.Attr.Scroll where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Scroll = Scroll

instance Deku.Attribute.Attr everything Scroll Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "scroll", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Scroll String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scroll", value: _ } <<< Deku.Attribute.prop'
