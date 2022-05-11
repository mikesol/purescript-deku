module Deku.DOM.Attr.Step where
import Deku.DOM.Elt.Input(Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Step = Step
instance Attr Input_ Step String where
  attr Step value = unsafeAttribute { key: "step", value: prop' value }
