module Deku.DOM.Attr.Formaction where
import Deku.DOM.Elt.Input(Input_)
import Deku.DOM.Elt.Button(Button_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Formaction = Formaction
instance Attr Input_ Formaction String where
  attr Formaction value = unsafeAttribute { key: "formaction", value: prop' value }

instance Attr Button_ Formaction String where
  attr Formaction value = unsafeAttribute { key: "formaction", value: prop' value }
