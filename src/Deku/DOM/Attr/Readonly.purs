module Deku.DOM.Attr.Readonly where
import Deku.DOM.Elt.Input(Input_)
import Deku.DOM.Elt.Textarea(Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Readonly = Readonly
instance Attr Input_ Readonly String where
  attr Readonly value = unsafeAttribute { key: "readonly", value: prop' value }

instance Attr Textarea_ Readonly String where
  attr Readonly value = unsafeAttribute { key: "readonly", value: prop' value }
