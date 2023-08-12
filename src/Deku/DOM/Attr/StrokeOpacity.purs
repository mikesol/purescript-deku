module Deku.DOM.Attr.StrokeOpacity where

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

data StrokeOpacity = StrokeOpacity

instance Attr Circle_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr ClipPath_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Defs_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Ellipse_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeBlend_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeColorMatrix_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeComponentTransfer_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeComposite_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeDisplacementMap_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeFlood_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeGaussianBlur_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeImage_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeMerge_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeMorphology_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeOffset_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeSpecularLighting_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeTile_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr FeTurbulence_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Filter_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr ForeignObject_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr G_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Image_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Line_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr LinearGradient_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Marker_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Mask_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Path_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Pattern_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Polygon_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Polyline_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr RadialGradient_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Rect_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Svg_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Switch_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Symbol_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Text_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr TextPath_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Tspan_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr Use_ StrokeOpacity String where
  attr StrokeOpacity value = unsafeAttribute
    { key: "stroke-opacity", value: prop' value }

instance Attr everything StrokeOpacity Unit where
  attr StrokeOpacity _ = unsafeAttribute
    { key: "stroke-opacity", value: unset' }
