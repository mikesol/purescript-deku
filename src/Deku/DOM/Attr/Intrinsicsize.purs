module Deku.DOM.Attr.Intrinsicsize where

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Intrinsicsize = Intrinsicsize

instance Attr Img_ Intrinsicsize String where
  attr Intrinsicsize value = unsafeAttribute
    { key: "intrinsicsize", value: prop' value }
