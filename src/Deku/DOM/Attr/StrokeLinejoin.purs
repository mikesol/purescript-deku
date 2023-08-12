module Deku.DOM.Attr.StrokeLinejoin where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
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

data StrokeLinejoin = StrokeLinejoin

instance Attr Circle_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr ClipPath_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Defs_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Ellipse_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeBlend_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeColorMatrix_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeComponentTransfer_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeComposite_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeDisplacementMap_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeFlood_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeGaussianBlur_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeImage_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeMerge_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeMorphology_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeOffset_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeSpecularLighting_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeTile_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr FeTurbulence_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Filter_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr ForeignObject_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr G_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Image_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Line_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr LinearGradient_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Marker_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Mask_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Path_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Pattern_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Polygon_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Polyline_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr RadialGradient_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Rect_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Svg_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Switch_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Symbol_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Text_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr TextPath_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Tspan_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr Use_ StrokeLinejoin String where
  attr StrokeLinejoin value = unsafeAttribute
    { key: "stroke-linejoin", value: prop' value }

instance Attr everything StrokeLinejoin Unit where
  attr StrokeLinejoin _ = unsafeAttribute
    { key: "stroke-linejoin", value: unset' }
