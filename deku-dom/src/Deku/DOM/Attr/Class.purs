module Deku.DOM.Attr.Class where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data Class = Class

instance Deku.Attribute.Attr everything Class Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "class", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything Class String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "class", value: _ } <<< Deku.Attribute.prop'
