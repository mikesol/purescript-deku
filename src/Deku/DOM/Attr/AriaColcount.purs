module Deku.DOM.Attr.AriaColcount where

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

data AriaColcount = AriaColcount

instance Attr Circle_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Ellipse_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr ForeignObject_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr G_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Line_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Marker_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Path_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Polygon_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Polyline_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Rect_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Svg_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Symbol_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Text_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr TextPath_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Tspan_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr Use_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr View_ AriaColcount String where
  attr AriaColcount value = unsafeAttribute
    { key: "aria-colcount", value: prop' value }

instance Attr everything AriaColcount Unit where
  attr AriaColcount _ = unsafeAttribute
    { key: "aria-colcount", value: unset' }
