module Deku.DOM.Attr.List where

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data List = List

instance Attr Input_ List String where
  attr List value = unsafeAttribute { key: "list", value: prop' value }
