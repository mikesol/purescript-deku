module Deku.DOM.Attr.AriaDescribedby where

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

data AriaDescribedby = AriaDescribedby

instance Attr Circle_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Ellipse_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr ForeignObject_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr G_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Line_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Marker_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Path_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Polygon_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Polyline_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Rect_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Svg_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Symbol_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Text_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr TextPath_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Tspan_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr Use_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr View_ AriaDescribedby String where
  attr AriaDescribedby value = unsafeAttribute
    { key: "aria-describedby", value: prop' value }

instance Attr everything AriaDescribedby Unit where
  attr AriaDescribedby _ = unsafeAttribute
    { key: "aria-describedby", value: unset' }
