module Deku.DOM.Attr.Data where
import Deku.DOM.Elt.Object(Object_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Data = Data
instance Attr Object_ Data String where
  attr Data value = unsafeAttribute { key: "data", value: prop' value }
