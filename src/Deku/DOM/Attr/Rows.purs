module Deku.DOM.Attr.Rows where
import Deku.DOM.Elt.Textarea(Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Rows = Rows
instance Attr Textarea_ Rows String where
  attr Rows value = unsafeAttribute { key: "rows", value: prop' value }
