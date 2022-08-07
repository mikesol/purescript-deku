module Deku.DOM.Attr.Action where
import Deku.DOM.Elt.Form(Form_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Action = Action
instance Attr Form_ Action String where
  attr Action value = unsafeAttribute { key: "action", value: prop' value }
