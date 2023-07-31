module Deku.DOM.Attr.Id where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Id = Id

instance Deku.Attribute.Attr everything Id Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "id", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Id String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "id", value: _ } <<< Deku.Attribute.prop'
