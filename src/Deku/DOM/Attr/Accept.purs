module Deku.DOM.Attr.Accept where
import Deku.DOM.Elt.Form(Form_)
import Deku.DOM.Elt.Input(Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Accept = Accept
instance Attr Form_ Accept String where
  attr Accept value = unsafeAttribute { key: "accept", value: prop' value }

instance Attr Input_ Accept String where
  attr Accept value = unsafeAttribute { key: "accept", value: prop' value }
