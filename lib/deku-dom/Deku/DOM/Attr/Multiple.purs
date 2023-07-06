module Deku.DOM.Attr.Multiple where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Select (Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Multiple = Multiple

instance Attr Input_ Multiple String where
  attr Multiple value = unsafeAttribute { key: "multiple", value: prop' value }

instance Attr Select_ Multiple String where
  attr Multiple value = unsafeAttribute { key: "multiple", value: prop' value }

instance Attr everything Multiple Unit where
  attr Multiple _ = unsafeAttribute
    { key: "multiple", value: unset' }
