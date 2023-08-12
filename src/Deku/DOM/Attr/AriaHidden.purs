module Deku.DOM.Attr.AriaHidden where

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

data AriaHidden = AriaHidden

instance Attr Circle_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Ellipse_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr ForeignObject_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr G_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Line_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Marker_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Path_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Polygon_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Polyline_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Rect_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Svg_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Symbol_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Text_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr TextPath_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Tspan_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr Use_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr View_ AriaHidden String where
  attr AriaHidden value = unsafeAttribute
    { key: "aria-hidden", value: prop' value }

instance Attr everything AriaHidden Unit where
  attr AriaHidden _ = unsafeAttribute
    { key: "aria-hidden", value: unset' }
