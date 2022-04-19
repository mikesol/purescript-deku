module Deku.DOM.Attr.Required where
import Deku.DOM.Elt.Input(Input_)
import Deku.DOM.Elt.Select(Select_)
import Deku.DOM.Elt.Textarea(Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Required = Required
instance Attr Input_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr Select_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }

instance Attr Textarea_ Required String where
  attr Required value = unsafeAttribute { key: "required", value: prop' value }
