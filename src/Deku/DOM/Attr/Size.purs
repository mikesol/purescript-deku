module Deku.DOM.Attr.Size where
import Deku.DOM.Elt.Input(Input_)
import Deku.DOM.Elt.Select(Select_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Size = Size
instance Attr Input_ Size String where
  attr Size value = unsafeAttribute { key: "size", value: prop' value }

instance Attr Select_ Size String where
  attr Size value = unsafeAttribute { key: "size", value: prop' value }
