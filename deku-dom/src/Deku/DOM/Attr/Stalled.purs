module Deku.DOM.Attr.Stalled where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Stalled = Stalled

instance Deku.Attribute.Attr everything Stalled Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stalled", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Stalled String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stalled", value: _ } <<< Deku.Attribute.prop'
