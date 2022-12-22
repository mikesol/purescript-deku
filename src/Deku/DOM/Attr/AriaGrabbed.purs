module Deku.DOM.Attr.AriaGrabbed where

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

data AriaGrabbed = AriaGrabbed

instance Attr Circle_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Ellipse_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr ForeignObject_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr G_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Line_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Marker_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Path_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Polygon_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Polyline_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Rect_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Svg_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Symbol_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Text_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr TextPath_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Tspan_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr Use_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr View_ AriaGrabbed String where
  attr AriaGrabbed value = unsafeAttribute
    { key: "aria-grabbed", value: prop' value }

instance Attr everything AriaGrabbed Unit where
  attr AriaGrabbed _ = unsafeAttribute
    { key: "aria-grabbed", value: unset' }
