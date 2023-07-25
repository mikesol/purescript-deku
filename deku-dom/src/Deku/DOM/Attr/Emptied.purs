module Deku.DOM.Attr.Emptied where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Emptied = Emptied

instance Deku.Attribute.Attr everything Emptied Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "emptied", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Emptied String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "emptied", value: _ } <<< Deku.Attribute.prop'
