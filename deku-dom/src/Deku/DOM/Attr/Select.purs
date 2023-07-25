module Deku.DOM.Attr.Select where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Select = Select

instance Deku.Attribute.Attr everything Select Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "select", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Select String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "select", value: _ } <<< Deku.Attribute.prop'
