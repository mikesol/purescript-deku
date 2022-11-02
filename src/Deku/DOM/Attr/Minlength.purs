module Deku.DOM.Attr.Minlength where

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Minlength = Minlength

instance Attr Input_ Minlength String where
  attr Minlength value = unsafeAttribute
    { key: "minlength", value: prop' value }

instance Attr Textarea_ Minlength String where
  attr Minlength value = unsafeAttribute
    { key: "minlength", value: prop' value }
