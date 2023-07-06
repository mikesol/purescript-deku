module Deku.DOM.Attr.AriaSetsize where

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

data AriaSetsize = AriaSetsize

instance Attr Circle_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Ellipse_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr ForeignObject_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr G_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Line_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Marker_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Path_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Polygon_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Polyline_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Rect_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Svg_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Symbol_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Text_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr TextPath_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Tspan_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr Use_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr View_ AriaSetsize String where
  attr AriaSetsize value = unsafeAttribute
    { key: "aria-setsize", value: prop' value }

instance Attr everything AriaSetsize Unit where
  attr AriaSetsize _ = unsafeAttribute
    { key: "aria-setsize", value: unset' }
