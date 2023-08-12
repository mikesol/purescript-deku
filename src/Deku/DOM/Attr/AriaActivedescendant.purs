module Deku.DOM.Attr.AriaActivedescendant where

import Prelude

import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AriaActivedescendant = AriaActivedescendant

instance Attr Circle_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Ellipse_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr ForeignObject_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr G_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Line_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Marker_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Path_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Polygon_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Polyline_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Rect_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Svg_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Symbol_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Text_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr TextPath_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Tspan_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr Use_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr View_ AriaActivedescendant String where
  attr AriaActivedescendant value = unsafeAttribute
    { key: "aria-activedescendant", value: prop' value }

instance Attr everything AriaActivedescendant Unit where
  attr AriaActivedescendant _ = unsafeAttribute
    { key: "aria-activedescendant", value: unset' }
