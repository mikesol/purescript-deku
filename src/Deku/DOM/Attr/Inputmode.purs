module Deku.DOM.Attr.Inputmode where
import Deku.DOM.Elt.Textarea(Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Inputmode = Inputmode
instance Attr Textarea_ Inputmode String where
  attr Inputmode value = unsafeAttribute { key: "inputmode", value: prop' value }
