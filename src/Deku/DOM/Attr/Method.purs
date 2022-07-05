module Deku.DOM.Attr.Method where
import Deku.DOM.Elt.Form(Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Method = Method
instance Attr Form_ Method String where
  attr Method value = unsafeAttribute { key: "method", value: prop' value }
