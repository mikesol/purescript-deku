module Deku.DOM.Attr.Dirname where

import Deku.DOM.Elt.Input (Input_)
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Dirname = Dirname

instance Attr Input_ Dirname String where
  attr Dirname value = unsafeAttribute { key: "dirname", value: prop' value }

instance Attr Textarea_ Dirname String where
  attr Dirname value = unsafeAttribute { key: "dirname", value: prop' value }
