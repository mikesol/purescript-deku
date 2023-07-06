module Deku.DOM.Attr.AriaCurrent where

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

data AriaCurrent = AriaCurrent

instance Attr Circle_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Ellipse_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr ForeignObject_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr G_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Line_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Marker_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Path_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Polygon_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Polyline_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Rect_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Svg_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Symbol_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Text_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr TextPath_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Tspan_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr Use_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr View_ AriaCurrent String where
  attr AriaCurrent value = unsafeAttribute
    { key: "aria-current", value: prop' value }

instance Attr everything AriaCurrent Unit where
  attr AriaCurrent _ = unsafeAttribute
    { key: "aria-current", value: unset' }
