module Deku.DOM.Attr.Visibility where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Defs (Defs_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Visibility = Visibility

instance Attr Circle_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr ClipPath_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Defs_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Ellipse_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeBlend_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeColorMatrix_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeComponentTransfer_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeComposite_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeConvolveMatrix_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeDiffuseLighting_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeDisplacementMap_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeFlood_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeGaussianBlur_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeImage_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeMerge_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeMorphology_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeOffset_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeSpecularLighting_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeTile_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr FeTurbulence_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Filter_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr ForeignObject_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr G_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Image_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Line_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr LinearGradient_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Marker_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Mask_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Path_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Pattern_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Polygon_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Polyline_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr RadialGradient_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Rect_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Stop_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Svg_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Switch_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Symbol_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Text_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr TextPath_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Tspan_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr Use_ Visibility String where
  attr Visibility value = unsafeAttribute
    { key: "visibility", value: prop' value }

instance Attr everything Visibility Unit where
  attr Visibility _ = unsafeAttribute
    { key: "visibility", value: unset' }
