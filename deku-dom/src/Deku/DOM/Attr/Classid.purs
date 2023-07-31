module Deku.DOM.Attr.Classid where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Object (Object_)

data Classid = Classid

instance Deku.Attribute.Attr everything Classid Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "classid", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Classid String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "classid", value: _ } <<< Deku.Attribute.prop'
