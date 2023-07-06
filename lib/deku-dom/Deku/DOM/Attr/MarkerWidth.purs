module Deku.DOM.Attr.MarkerWidth where

import Prelude

import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data MarkerWidth = MarkerWidth

instance Attr Marker_ MarkerWidth String where
  attr MarkerWidth value = unsafeAttribute
    { key: "markerWidth", value: prop' value }

instance Attr everything MarkerWidth Unit where
  attr MarkerWidth _ = unsafeAttribute
    { key: "markerWidth", value: unset' }
