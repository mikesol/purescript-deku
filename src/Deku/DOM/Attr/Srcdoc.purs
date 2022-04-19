module Deku.DOM.Attr.Srcdoc where
import Deku.DOM.Elt.Iframe(Iframe_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Srcdoc = Srcdoc
instance Attr Iframe_ Srcdoc String where
  attr Srcdoc value = unsafeAttribute { key: "srcdoc", value: prop' value }
