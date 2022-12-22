module Deku.DOM.Attr.Points where

import Prelude

import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Points = Points

instance Attr Polygon_ Points String where
  attr Points value = unsafeAttribute { key: "points", value: prop' value }

instance Attr Polyline_ Points String where
  attr Points value = unsafeAttribute { key: "points", value: prop' value }

instance Attr everything Points Unit where
  attr Points _ = unsafeAttribute
    { key: "points", value: unset' }
