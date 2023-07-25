module Deku.DOM.Attr.Contextrestored where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Contextrestored = Contextrestored

instance Deku.Attribute.Attr everything Contextrestored Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "contextrestored", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Contextrestored String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "contextrestored", value: _ } <<<
    Deku.Attribute.prop'
