module Deku.DOM.Attr.Color where

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
import Deku.DOM.Elt.Font (Font_)
import Deku.DOM.Elt.Hr (Hr_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Color = Color

instance Attr Font_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Hr_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Circle_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr ClipPath_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Defs_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Ellipse_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeBlend_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeColorMatrix_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeComponentTransfer_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeComposite_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeConvolveMatrix_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeDiffuseLighting_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeDisplacementMap_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeFlood_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeGaussianBlur_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeImage_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeMerge_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeMorphology_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeOffset_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeSpecularLighting_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeTile_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr FeTurbulence_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Filter_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr ForeignObject_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr G_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Image_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Line_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr LinearGradient_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Marker_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Mask_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Path_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Pattern_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Polygon_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Polyline_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr RadialGradient_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Rect_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Stop_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Svg_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Switch_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Symbol_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Text_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr TextPath_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Tspan_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr Use_ Color String where
  attr Color value = unsafeAttribute { key: "color", value: prop' value }

instance Attr everything Color Unit where
  attr Color _ = unsafeAttribute
    { key: "color", value: unset' }
