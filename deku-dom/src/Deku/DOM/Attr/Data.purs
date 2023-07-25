module Deku.DOM.Attr.Data where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Object (Object_)

data Data = Data

instance Deku.Attribute.Attr everything Data Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "data", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Object_ Data String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "data", value: _ } <<< Deku.Attribute.prop'
