module Deku.DOM.Attr.Checked where
import Deku.DOM.Elt.Input(Input_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Checked = Checked
instance Attr Input_ Checked String where
  attr Checked value = unsafeAttribute { key: "checked", value: prop' value }
