module Deku.DOM.Attr.Dir where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Dir = Dir

instance Deku.Attribute.Attr everything Dir Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dir", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Dir String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dir", value: _ } <<< Deku.Attribute.prop'
