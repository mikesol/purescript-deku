module Deku.DOM.Attr.AriaFlowto where

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

data AriaFlowto = AriaFlowto

instance Attr Circle_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Ellipse_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr ForeignObject_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr G_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Line_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Marker_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Path_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Polygon_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Polyline_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Rect_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Svg_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Symbol_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Text_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr TextPath_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Tspan_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr Use_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr View_ AriaFlowto String where
  attr AriaFlowto value = unsafeAttribute
    { key: "aria-flowto", value: prop' value }

instance Attr everything AriaFlowto Unit where
  attr AriaFlowto _ = unsafeAttribute
    { key: "aria-flowto", value: unset' }
