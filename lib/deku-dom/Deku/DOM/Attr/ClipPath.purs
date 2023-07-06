module Deku.DOM.Attr.ClipPath where

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

data ClipPath = ClipPath

instance Attr Circle_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr ClipPath_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Defs_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Ellipse_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeBlend_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeColorMatrix_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeComponentTransfer_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeComposite_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeConvolveMatrix_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeDiffuseLighting_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeDisplacementMap_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeFlood_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeGaussianBlur_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeImage_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeMerge_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeMorphology_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeOffset_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeSpecularLighting_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeTile_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr FeTurbulence_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Filter_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr ForeignObject_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr G_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Image_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Line_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr LinearGradient_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Marker_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Mask_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Path_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Pattern_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Polygon_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Polyline_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr RadialGradient_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Rect_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Svg_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Switch_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Symbol_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Text_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr TextPath_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Tspan_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr Use_ ClipPath String where
  attr ClipPath value = unsafeAttribute { key: "clip-path", value: prop' value }

instance Attr everything ClipPath Unit where
  attr ClipPath _ = unsafeAttribute
    { key: "clip-path", value: unset' }
