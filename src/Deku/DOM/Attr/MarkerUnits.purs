module Deku.DOM.Attr.MarkerUnits where

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data MarkerUnits = MarkerUnits

instance Attr Marker_ MarkerUnits String where
  attr MarkerUnits value = unsafeAttribute { key: "markerUnits", value: prop' value }