module Deku.DOM.Attr.MarkerHeight where

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data MarkerHeight = MarkerHeight

instance Attr Marker_ MarkerHeight String where
  attr MarkerHeight value = unsafeAttribute
    { key: "markerHeight", value: prop' value }