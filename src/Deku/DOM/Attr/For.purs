module Deku.DOM.Attr.For where
import Deku.DOM.Elt.Label(Label_)
import Deku.DOM.Elt.Output(Output_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data For = For
instance Attr Label_ For String where
  attr For value = unsafeAttribute { key: "for", value: prop' value }

instance Attr Output_ For String where
  attr For value = unsafeAttribute { key: "for", value: prop' value }
