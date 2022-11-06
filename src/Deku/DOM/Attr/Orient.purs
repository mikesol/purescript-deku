module Deku.DOM.Attr.Orient where

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Orient = Orient

instance Attr Marker_ Orient String where
  attr Orient value = unsafeAttribute { key: "orient", value: prop' value }