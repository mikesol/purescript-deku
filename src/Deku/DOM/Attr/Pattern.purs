module Deku.DOM.Attr.Pattern where
import Deku.DOM.Elt.Input(Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Pattern = Pattern
instance Attr Input_ Pattern String where
  attr Pattern value = unsafeAttribute { key: "pattern", value: prop' value }
