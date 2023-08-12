module Deku.DOM.Attr.AriaHaspopup where

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

data AriaHaspopup = AriaHaspopup

instance Attr Circle_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Ellipse_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr ForeignObject_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr G_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Line_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Marker_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Path_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Polygon_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Polyline_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Rect_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Svg_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Symbol_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Text_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr TextPath_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Tspan_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr Use_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr View_ AriaHaspopup String where
  attr AriaHaspopup value = unsafeAttribute
    { key: "aria-haspopup", value: prop' value }

instance Attr everything AriaHaspopup Unit where
  attr AriaHaspopup _ = unsafeAttribute
    { key: "aria-haspopup", value: unset' }
