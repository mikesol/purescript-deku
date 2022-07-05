module Deku.DOM.Attr.Enctype where
import Deku.DOM.Elt.Form(Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Enctype = Enctype
instance Attr Form_ Enctype String where
  attr Enctype value = unsafeAttribute { key: "enctype", value: prop' value }
