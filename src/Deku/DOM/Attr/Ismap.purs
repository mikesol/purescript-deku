module Deku.DOM.Attr.Ismap where
import Deku.DOM.Elt.Img(Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)
data Ismap = Ismap
instance Attr Img_ Ismap String where
  attr Ismap value = unsafeAttribute { key: "ismap", value: prop' value }
