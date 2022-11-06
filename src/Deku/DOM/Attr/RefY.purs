module Deku.DOM.Attr.RefY where

import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data RefY = RefY

instance Attr Marker_ RefY String where
  attr RefY value = unsafeAttribute { key: "refY", value: prop' value }
instance Attr Symbol_ RefY String where
  attr RefY value = unsafeAttribute { key: "refY", value: prop' value }