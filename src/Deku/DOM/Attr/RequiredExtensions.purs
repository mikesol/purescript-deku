module Deku.DOM.Attr.RequiredExtensions where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data RequiredExtensions = RequiredExtensions

instance Attr AnimateTransform_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Circle_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr ClipPath_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Discard_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Ellipse_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr ForeignObject_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr G_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Image_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Line_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Marker_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Mask_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Path_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Pattern_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Polygon_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Polyline_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Rect_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Svg_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Switch_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Text_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr TextPath_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Tspan_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr Use_ RequiredExtensions String where
  attr RequiredExtensions value = unsafeAttribute
    { key: "requiredExtensions", value: prop' value }

instance Attr everything RequiredExtensions Unit where
  attr RequiredExtensions _ = unsafeAttribute
    { key: "requiredExtensions", value: unset' }
