module Deku.DOM.Attr.Methods where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Link (Link_)

data Methods = Methods

instance Deku.Attribute.Attr everything Methods Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "methods", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Link_ Methods String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "methods", value: _ } <<< Deku.Attribute.prop'
