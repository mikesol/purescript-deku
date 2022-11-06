module Deku.DOM.Attr.AriaPosinset where

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
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data AriaPosinset = AriaPosinset

instance Attr Circle_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Ellipse_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr ForeignObject_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr G_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Line_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Marker_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Path_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Polygon_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Polyline_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Rect_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Svg_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Symbol_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Text_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr TextPath_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Tspan_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr Use_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }

instance Attr View_ AriaPosinset String where
  attr AriaPosinset value = unsafeAttribute
    { key: "aria-posinset", value: prop' value }