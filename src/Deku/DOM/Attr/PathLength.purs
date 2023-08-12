module Deku.DOM.Attr.PathLength where

import Prelude

import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PathLength = PathLength

instance Attr Circle_ PathLength String where
  attr PathLength value = unsafeAttribute
    { key: "pathLength", value: prop' value }

instance Attr Ellipse_ PathLength String where
  attr PathLength value = unsafeAttribute
    { key: "pathLength", value: prop' value }

instance Attr Line_ PathLength String where
  attr PathLength value = unsafeAttribute
    { key: "pathLength", value: prop' value }

instance Attr Path_ PathLength String where
  attr PathLength value = unsafeAttribute
    { key: "pathLength", value: prop' value }

instance Attr Polygon_ PathLength String where
  attr PathLength value = unsafeAttribute
    { key: "pathLength", value: prop' value }

instance Attr Polyline_ PathLength String where
  attr PathLength value = unsafeAttribute
    { key: "pathLength", value: prop' value }

instance Attr Rect_ PathLength String where
  attr PathLength value = unsafeAttribute
    { key: "pathLength", value: prop' value }

instance Attr everything PathLength Unit where
  attr PathLength _ = unsafeAttribute
    { key: "pathLength", value: unset' }
