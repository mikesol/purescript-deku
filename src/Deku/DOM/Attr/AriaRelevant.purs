module Deku.DOM.Attr.AriaRelevant where

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

data AriaRelevant = AriaRelevant

instance Attr Circle_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Ellipse_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr ForeignObject_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr G_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Line_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Marker_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Path_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Polygon_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Polyline_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Rect_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Svg_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Symbol_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Text_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr TextPath_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Tspan_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr Use_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr View_ AriaRelevant String where
  attr AriaRelevant value = unsafeAttribute
    { key: "aria-relevant", value: prop' value }

instance Attr everything AriaRelevant Unit where
  attr AriaRelevant _ = unsafeAttribute
    { key: "aria-relevant", value: unset' }
