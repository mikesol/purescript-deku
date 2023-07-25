module Deku.DOM.Attr.Reset where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Reset = Reset

instance Deku.Attribute.Attr everything Reset Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "reset", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Reset String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "reset", value: _ } <<< Deku.Attribute.prop'
