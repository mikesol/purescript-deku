module Deku.DOM.Attr.Cut where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Cut = Cut

instance Deku.Attribute.Attr everything Cut Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "cut", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Cut String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "cut", value: _ } <<< Deku.Attribute.prop'
