module Deku.DOM.Attr.Error where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Error = Error

instance Deku.Attribute.Attr everything Error Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "error", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Error String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "error", value: _ } <<< Deku.Attribute.prop'
