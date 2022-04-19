module Deku.DOM.Attr.Language where
import Deku.DOM.Elt.Script(Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Language = Language
instance Attr Script_ Language String where
  attr Language value = unsafeAttribute { key: "language", value: prop' value }
