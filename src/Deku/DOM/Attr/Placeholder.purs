module Deku.DOM.Attr.Placeholder where

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Placeholder = Placeholder

instance Attr Input_ Placeholder String where
  attr Placeholder value = unsafeAttribute
    { key: "placeholder", value: prop' value }

instance Attr Textarea_ Placeholder String where
  attr Placeholder value = unsafeAttribute
    { key: "placeholder", value: prop' value }
