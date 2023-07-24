module Deku.DOM.Attr.Standby where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Object (Object_)

data Standby = Standby

instance Deku.Attribute.Attr everything Standby Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "standby", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Standby String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "standby", value: _ } <<< Deku.Attribute.prop'
