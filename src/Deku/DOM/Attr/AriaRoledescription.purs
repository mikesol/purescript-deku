module Deku.DOM.Attr.AriaRoledescription where

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

data AriaRoledescription = AriaRoledescription

instance Attr Circle_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Ellipse_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr ForeignObject_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr G_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Line_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Marker_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Path_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Polygon_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Polyline_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Rect_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Svg_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Symbol_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Text_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr TextPath_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Tspan_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr Use_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr View_ AriaRoledescription String where
  attr AriaRoledescription value = unsafeAttribute
    { key: "aria-roledescription", value: prop' value }

instance Attr everything AriaRoledescription Unit where
  attr AriaRoledescription _ = unsafeAttribute
    { key: "aria-roledescription", value: unset' }
