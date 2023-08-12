module Deku.DOM.Attr.SystemLanguage where

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

data SystemLanguage = SystemLanguage

instance Attr AnimateTransform_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Circle_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr ClipPath_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Discard_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Ellipse_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr ForeignObject_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr G_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Image_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Line_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Marker_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Mask_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Path_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Pattern_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Polygon_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Polyline_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Rect_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Svg_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Switch_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Text_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr TextPath_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Tspan_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr Use_ SystemLanguage String where
  attr SystemLanguage value = unsafeAttribute
    { key: "systemLanguage", value: prop' value }

instance Attr everything SystemLanguage Unit where
  attr SystemLanguage _ = unsafeAttribute
    { key: "systemLanguage", value: unset' }
