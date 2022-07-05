module Deku.DOM.Attr.Novalidate where
import Deku.DOM.Elt.Form(Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Novalidate = Novalidate
instance Attr Form_ Novalidate String where
  attr Novalidate value = unsafeAttribute { key: "novalidate", value: prop' value }
