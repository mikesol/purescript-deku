module Deku.DOM.Attr.Integrity where
import Deku.DOM.Elt.Link(Link_)
import Deku.DOM.Elt.Script(Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Integrity = Integrity
instance Attr Link_ Integrity String where
  attr Integrity value = unsafeAttribute { key: "integrity", value: prop' value }

instance Attr Script_ Integrity String where
  attr Integrity value = unsafeAttribute { key: "integrity", value: prop' value }
