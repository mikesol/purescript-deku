module Deku.DOM.Attr.Nomodule where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Script (Script_)

data Nomodule = Nomodule

instance Deku.Attribute.Attr everything Nomodule Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "nomodule", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Script_ Nomodule String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "nomodule", value: _ } <<< Deku.Attribute.prop'
