module Deku.DOM.Attr.Vlink where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Body (Body_)

data Vlink = Vlink

instance Deku.Attribute.Attr everything Vlink Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "vlink", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Body_ Vlink String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "vlink", value: _ } <<< Deku.Attribute.prop'
