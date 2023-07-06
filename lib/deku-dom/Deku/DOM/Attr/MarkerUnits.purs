module Deku.DOM.Attr.MarkerUnits where

import Prelude

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerUnits = MarkerUnits

instance Attr Marker_ MarkerUnits String where
  attr MarkerUnits value = unsafeAttribute
    { key: "markerUnits", value: prop' value }

instance Attr everything MarkerUnits Unit where
  attr MarkerUnits _ = unsafeAttribute
    { key: "markerUnits", value: unset' }
