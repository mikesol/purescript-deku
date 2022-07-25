module Deku.DOM.Attr.Reversed where

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Reversed = Reversed

instance Attr Ol_ Reversed String where
  attr Reversed value = unsafeAttribute { key: "reversed", value: prop' value }
