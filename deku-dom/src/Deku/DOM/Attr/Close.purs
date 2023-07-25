module Deku.DOM.Attr.Close where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Close = Close

instance Deku.Attribute.Attr everything Close Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "close", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Close String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "close", value: _ } <<< Deku.Attribute.prop'
