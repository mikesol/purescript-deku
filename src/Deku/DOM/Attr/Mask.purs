module Deku.DOM.Attr.Mask where

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

data Mask = Mask

instance Attr Circle_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr ClipPath_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Defs_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Ellipse_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeBlend_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeColorMatrix_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeComponentTransfer_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeComposite_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeConvolveMatrix_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeDiffuseLighting_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeDisplacementMap_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeFlood_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeGaussianBlur_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeImage_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeMerge_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeMorphology_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeOffset_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeSpecularLighting_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeTile_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr FeTurbulence_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Filter_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr ForeignObject_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr G_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Image_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Line_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr LinearGradient_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Marker_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Mask_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Path_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Pattern_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Polygon_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Polyline_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr RadialGradient_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Rect_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Svg_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Switch_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Symbol_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Text_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr TextPath_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Tspan_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr Use_ Mask String where
  attr Mask value = unsafeAttribute { key: "mask", value: prop' value }

instance Attr everything Mask Unit where
  attr Mask _ = unsafeAttribute
    { key: "mask", value: unset' }
