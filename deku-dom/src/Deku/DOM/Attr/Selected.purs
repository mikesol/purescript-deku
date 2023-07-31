module Deku.DOM.Attr.Selected where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.Option (Option_)

data Selected = Selected

instance Deku.Attribute.Attr everything Selected Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "selected", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr Option_ Selected String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "selected", value: _ } <<< Deku.Attribute.prop'
