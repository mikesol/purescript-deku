module Deku.DOM.Attr.Invalid where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Invalid = Invalid

instance Deku.Attribute.Attr everything Invalid Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "invalid", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Invalid String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "invalid", value: _ } <<< Deku.Attribute.prop'
