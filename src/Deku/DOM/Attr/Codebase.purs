module Deku.DOM.Attr.Codebase where
import Deku.DOM.Elt.Applet(Applet_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Codebase = Codebase
instance Attr Applet_ Codebase String where
  attr Codebase value = unsafeAttribute { key: "codebase", value: prop' value }
