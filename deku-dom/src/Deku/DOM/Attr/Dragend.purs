module Deku.DOM.Attr.Dragend where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Dragend = Dragend

instance Deku.Attribute.Attr everything Dragend Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "dragend", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Dragend String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "dragend", value: _ } <<< Deku.Attribute.prop'
