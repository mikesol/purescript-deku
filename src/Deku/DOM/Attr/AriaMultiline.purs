module Deku.DOM.Attr.AriaMultiline where

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

data AriaMultiline = AriaMultiline

instance Attr Circle_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Ellipse_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr ForeignObject_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr G_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Line_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Marker_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Path_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Polygon_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Polyline_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Rect_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Svg_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Symbol_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Text_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr TextPath_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Tspan_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr Use_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr View_ AriaMultiline String where
  attr AriaMultiline value = unsafeAttribute
    { key: "aria-multiline", value: prop' value }

instance Attr everything AriaMultiline Unit where
  attr AriaMultiline _ = unsafeAttribute
    { key: "aria-multiline", value: unset' }
