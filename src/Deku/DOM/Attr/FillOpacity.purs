module Deku.DOM.Attr.FillOpacity where

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

data FillOpacity = FillOpacity

instance Attr Circle_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr ClipPath_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Defs_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Ellipse_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeBlend_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeColorMatrix_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeComponentTransfer_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeComposite_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeConvolveMatrix_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeDiffuseLighting_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeDisplacementMap_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeFlood_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeGaussianBlur_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeImage_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeMerge_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeMorphology_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeOffset_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeSpecularLighting_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeTile_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr FeTurbulence_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Filter_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr ForeignObject_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr G_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Image_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Line_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr LinearGradient_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Marker_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Mask_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Path_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Pattern_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Polygon_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Polyline_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr RadialGradient_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Rect_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Svg_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Switch_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Symbol_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Text_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr TextPath_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Tspan_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr Use_ FillOpacity String where
  attr FillOpacity value = unsafeAttribute
    { key: "fill-opacity", value: prop' value }

instance Attr everything FillOpacity Unit where
  attr FillOpacity _ = unsafeAttribute
    { key: "fill-opacity", value: unset' }
