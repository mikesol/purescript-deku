module Deku.DOM.Attr.AriaColindex where

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

data AriaColindex = AriaColindex

instance Attr Circle_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Ellipse_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr ForeignObject_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr G_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Line_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Marker_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Path_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Polygon_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Polyline_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Rect_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Svg_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Symbol_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Text_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr TextPath_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Tspan_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr Use_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr View_ AriaColindex String where
  attr AriaColindex value = unsafeAttribute
    { key: "aria-colindex", value: prop' value }

instance Attr everything AriaColindex Unit where
  attr AriaColindex _ = unsafeAttribute
    { key: "aria-colindex", value: unset' }
