module Deku.DOM.Attr.RefX where

import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data RefX = RefX

instance Attr Marker_ RefX String where
  attr RefX value = unsafeAttribute { key: "refX", value: prop' value }
instance Attr Symbol_ RefX String where
  attr RefX value = unsafeAttribute { key: "refX", value: prop' value }