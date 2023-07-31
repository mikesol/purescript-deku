module Deku.DOM.Attr.Style where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Style = Style

instance Deku.Attribute.Attr everything Style Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "style", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Style String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "style", value: _ } <<< Deku.Attribute.prop'
