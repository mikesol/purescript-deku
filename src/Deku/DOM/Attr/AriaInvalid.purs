module Deku.DOM.Attr.AriaInvalid where

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

data AriaInvalid = AriaInvalid

instance Attr Circle_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Ellipse_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr ForeignObject_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr G_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Line_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Marker_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Path_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Polygon_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Polyline_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Rect_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Svg_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Symbol_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Text_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr TextPath_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Tspan_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr Use_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr View_ AriaInvalid String where
  attr AriaInvalid value = unsafeAttribute
    { key: "aria-invalid", value: prop' value }

instance Attr everything AriaInvalid Unit where
  attr AriaInvalid _ = unsafeAttribute
    { key: "aria-invalid", value: unset' }
