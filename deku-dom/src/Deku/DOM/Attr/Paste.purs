module Deku.DOM.Attr.Paste where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Paste = Paste

instance Deku.Attribute.Attr everything Paste Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "paste", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Paste String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "paste", value: _ } <<< Deku.Attribute.prop'
