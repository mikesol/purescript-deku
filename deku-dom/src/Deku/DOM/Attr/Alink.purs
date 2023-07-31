module Deku.DOM.Attr.Alink where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Body (Body_)

data Alink = Alink

instance Deku.Attribute.Attr everything Alink Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "alink", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Alink String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "alink", value: _ } <<< Deku.Attribute.prop'
