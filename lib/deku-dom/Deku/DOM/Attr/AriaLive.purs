module Deku.DOM.Attr.AriaLive where

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

data AriaLive = AriaLive

instance Attr Circle_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Ellipse_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr ForeignObject_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr G_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Line_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Marker_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Path_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Polygon_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Polyline_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Rect_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Svg_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Symbol_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Text_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr TextPath_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Tspan_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr Use_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr View_ AriaLive String where
  attr AriaLive value = unsafeAttribute { key: "aria-live", value: prop' value }

instance Attr everything AriaLive Unit where
  attr AriaLive _ = unsafeAttribute
    { key: "aria-live", value: unset' }
