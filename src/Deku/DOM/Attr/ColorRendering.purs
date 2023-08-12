module Deku.DOM.Attr.ColorRendering where

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

data ColorRendering = ColorRendering

instance Attr Circle_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Defs_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Ellipse_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeBlend_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeColorMatrix_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeComponentTransfer_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeComposite_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeConvolveMatrix_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeDiffuseLighting_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeDisplacementMap_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeFlood_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeGaussianBlur_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeImage_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeMerge_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeMorphology_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeOffset_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeSpecularLighting_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeTile_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr FeTurbulence_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Filter_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr ForeignObject_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr G_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Image_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Line_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr LinearGradient_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Marker_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Path_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Pattern_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Polygon_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Polyline_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr RadialGradient_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Rect_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Svg_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Switch_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Symbol_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Text_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr TextPath_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Tspan_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr Use_ ColorRendering String where
  attr ColorRendering value = unsafeAttribute
    { key: "color-rendering", value: prop' value }

instance Attr everything ColorRendering Unit where
  attr ColorRendering _ = unsafeAttribute
    { key: "color-rendering", value: unset' }
