module Deku.DOM.Attr.Suspend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Suspend = Suspend

instance Deku.Attribute.Attr everything Suspend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "suspend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Suspend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "suspend", value: _ } <<< Deku.Attribute.prop'
