module Deku.DOM.Attr.Points where

import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Points = Points

instance Attr Polygon_ Points String where
  attr Points value = unsafeAttribute { key: "points", value: prop' value }
instance Attr Polyline_ Points String where
  attr Points value = unsafeAttribute { key: "points", value: prop' value }