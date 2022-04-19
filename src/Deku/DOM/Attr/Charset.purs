module Deku.DOM.Attr.Charset where
import Deku.DOM.Elt.Meta(Meta_)
import Deku.DOM.Elt.Script(Script_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Charset = Charset
instance Attr Meta_ Charset String where
  attr Charset value = unsafeAttribute { key: "charset", value: prop' value }

instance Attr Script_ Charset String where
  attr Charset value = unsafeAttribute { key: "charset", value: prop' value }
