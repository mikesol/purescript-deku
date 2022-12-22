module Deku.DOM.Attr.Size where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Size = Size

instance Attr Input_ Size String where
  attr Size value = unsafeAttribute { key: "size", value: prop' value }

instance Attr Select_ Size String where
  attr Size value = unsafeAttribute { key: "size", value: prop' value }

instance Attr everything Size Unit where
  attr Size _ = unsafeAttribute
    { key: "size", value: unset' }
