module Deku.DOM.Attr.AriaBusy where

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

data AriaBusy = AriaBusy

instance Attr Circle_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Ellipse_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr ForeignObject_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr G_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Line_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Marker_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Path_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Polygon_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Polyline_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Rect_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Svg_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Symbol_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Text_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr TextPath_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Tspan_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr Use_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr View_ AriaBusy String where
  attr AriaBusy value = unsafeAttribute { key: "aria-busy", value: prop' value }

instance Attr everything AriaBusy Unit where
  attr AriaBusy _ = unsafeAttribute
    { key: "aria-busy", value: unset' }
