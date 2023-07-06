module Deku.DOM.Attr.Reversed where

import Prelude

import Deku.DOM.Elt.Ol (Ol_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Reversed = Reversed

instance Attr Ol_ Reversed String where
  attr Reversed value = unsafeAttribute { key: "reversed", value: prop' value }

instance Attr everything Reversed Unit where
  attr Reversed _ = unsafeAttribute
    { key: "reversed", value: unset' }
