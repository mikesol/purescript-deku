module Deku.DOM.Attr.AriaReadonly where

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

data AriaReadonly = AriaReadonly

instance Attr Circle_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Ellipse_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr ForeignObject_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr G_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Line_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Marker_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Path_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Polygon_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Polyline_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Rect_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Svg_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Symbol_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Text_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr TextPath_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Tspan_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr Use_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr View_ AriaReadonly String where
  attr AriaReadonly value = unsafeAttribute
    { key: "aria-readonly", value: prop' value }

instance Attr everything AriaReadonly Unit where
  attr AriaReadonly _ = unsafeAttribute
    { key: "aria-readonly", value: unset' }
