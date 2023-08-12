module Deku.DOM.Attr.ColorInterpolation where

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
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data ColorInterpolation = ColorInterpolation

instance Attr Circle_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Defs_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Ellipse_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeBlend_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeColorMatrix_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeComponentTransfer_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeComposite_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeConvolveMatrix_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeDiffuseLighting_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeDisplacementMap_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeFlood_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeGaussianBlur_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeImage_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeMerge_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeMorphology_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeOffset_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeSpecularLighting_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeTile_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr FeTurbulence_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Filter_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr ForeignObject_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr G_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Image_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Line_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr LinearGradient_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Marker_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Path_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Pattern_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Polygon_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Polyline_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr RadialGradient_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Rect_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Svg_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Switch_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Symbol_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Text_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr TextPath_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Tspan_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr Use_ ColorInterpolation String where
  attr ColorInterpolation value = unsafeAttribute
    { key: "color-interpolation", value: prop' value }

instance Attr everything ColorInterpolation Unit where
  attr ColorInterpolation _ = unsafeAttribute
    { key: "color-interpolation", value: unset' }
