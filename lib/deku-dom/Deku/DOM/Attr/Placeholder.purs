module Deku.DOM.Attr.Placeholder where

import Prelude

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Placeholder = Placeholder

instance Attr Input_ Placeholder String where
  attr Placeholder value = unsafeAttribute
    { key: "placeholder", value: prop' value }

instance Attr Textarea_ Placeholder String where
  attr Placeholder value = unsafeAttribute
    { key: "placeholder", value: prop' value }

instance Attr everything Placeholder Unit where
  attr Placeholder _ = unsafeAttribute
    { key: "placeholder", value: unset' }
