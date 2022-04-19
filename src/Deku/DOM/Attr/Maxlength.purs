module Deku.DOM.Attr.Maxlength where
import Deku.DOM.Elt.Input(Input_)
import Deku.DOM.Elt.Textarea(Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Maxlength = Maxlength
instance Attr Input_ Maxlength String where
  attr Maxlength value = unsafeAttribute { key: "maxlength", value: prop' value }

instance Attr Textarea_ Maxlength String where
  attr Maxlength value = unsafeAttribute { key: "maxlength", value: prop' value }
