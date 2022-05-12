module Deku.DOM.Attr.AcceptCharset where
import Deku.DOM.Elt.Form(Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data AcceptCharset = AcceptCharset
instance Attr Form_ AcceptCharset String where
  attr AcceptCharset value = unsafeAttribute { key: "accept-charset", value: prop' value }
