module Deku.DOM.Attr.MarkerWidth where

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data MarkerWidth = MarkerWidth

instance Attr Marker_ MarkerWidth String where
  attr MarkerWidth value = unsafeAttribute { key: "markerWidth", value: prop' value }