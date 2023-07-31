module Deku.DOM.Attr.Code where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Object (Object_)

data Code = Code

instance Deku.Attribute.Attr everything Code Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "code", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Code String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "code", value: _ } <<< Deku.Attribute.prop'
