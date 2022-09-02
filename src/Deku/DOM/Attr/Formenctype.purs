module Deku.DOM.Attr.Formenctype where
import Deku.DOM.Elt.Button(Button_)
import Deku.DOM.Elt.Input(Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Formenctype = Formenctype
instance Attr Button_ Formenctype String where
  attr Formenctype value = unsafeAttribute { key: "formenctype", value: prop' value }

instance Attr Input_ Formenctype String where
  attr Formenctype value = unsafeAttribute { key: "formenctype", value: prop' value }
