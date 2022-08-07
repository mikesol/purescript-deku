module Deku.DOM.Attr.HttpEquiv where
import Deku.DOM.Elt.Meta(Meta_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data HttpEquiv = HttpEquiv
instance Attr Meta_ HttpEquiv String where
  attr HttpEquiv value = unsafeAttribute { key: "http-equiv", value: prop' value }
