module Deku.DOM.Attr.StrokeWidth where

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

data StrokeWidth = StrokeWidth

instance Attr Circle_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr ClipPath_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Defs_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Ellipse_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeBlend_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeColorMatrix_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeComponentTransfer_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeComposite_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeDisplacementMap_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeFlood_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeGaussianBlur_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeImage_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeMerge_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeMorphology_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeOffset_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeSpecularLighting_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeTile_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr FeTurbulence_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Filter_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr ForeignObject_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr G_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Image_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Line_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr LinearGradient_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Marker_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Mask_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Path_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Pattern_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Polygon_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Polyline_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr RadialGradient_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Rect_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Svg_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Switch_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Symbol_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Text_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr TextPath_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Tspan_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr Use_ StrokeWidth String where
  attr StrokeWidth value = unsafeAttribute
    { key: "stroke-width", value: prop' value }

instance Attr everything StrokeWidth Unit where
  attr StrokeWidth _ = unsafeAttribute
    { key: "stroke-width", value: unset' }
