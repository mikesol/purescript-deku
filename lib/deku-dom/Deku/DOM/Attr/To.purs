module Deku.DOM.Attr.To where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.Set (Set_)

data To = To

instance Deku.Attribute.Attr everything To Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "to", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Set_ To String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "to", value: _ } <<< Deku.Attribute.prop'
