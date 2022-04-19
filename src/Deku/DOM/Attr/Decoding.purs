module Deku.DOM.Attr.Decoding where
import Deku.DOM.Elt.Img(Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Decoding = Decoding
instance Attr Img_ Decoding String where
  attr Decoding value = unsafeAttribute { key: "decoding", value: prop' value }
