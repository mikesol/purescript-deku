module Deku.DOM.Attr.Intrinsicsize where

import Prelude

import Deku.DOM.Elt.Img (Img_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Intrinsicsize = Intrinsicsize

instance Attr Img_ Intrinsicsize String where
  attr Intrinsicsize value = unsafeAttribute
    { key: "intrinsicsize", value: prop' value }

instance Attr everything Intrinsicsize Unit where
  attr Intrinsicsize _ = unsafeAttribute
    { key: "intrinsicsize", value: unset' }
