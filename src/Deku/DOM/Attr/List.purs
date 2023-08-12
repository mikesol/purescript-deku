module Deku.DOM.Attr.List where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data List = List

instance Attr Input_ List String where
  attr List value = unsafeAttribute { key: "list", value: prop' value }

instance Attr everything List Unit where
  attr List _ = unsafeAttribute
    { key: "list", value: unset' }
