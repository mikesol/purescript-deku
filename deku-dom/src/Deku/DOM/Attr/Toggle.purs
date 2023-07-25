module Deku.DOM.Attr.Toggle where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Toggle = Toggle

instance Deku.Attribute.Attr everything Toggle Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "toggle", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Toggle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "toggle", value: _ } <<< Deku.Attribute.prop'
