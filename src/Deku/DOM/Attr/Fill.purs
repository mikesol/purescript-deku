module Deku.DOM.Attr.Fill where

import Prelude

import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Set (Set_)
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
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.Animate (Animate_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Fill = Fill

instance Attr Animate_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr AnimateMotion_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr AnimateTransform_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Circle_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr ClipPath_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Defs_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Ellipse_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeBlend_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeColorMatrix_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeComponentTransfer_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeComposite_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeConvolveMatrix_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeDiffuseLighting_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeDisplacementMap_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeFlood_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeGaussianBlur_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeImage_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeMerge_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeMorphology_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeOffset_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeSpecularLighting_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeTile_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr FeTurbulence_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Filter_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr ForeignObject_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr G_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Image_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Line_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr LinearGradient_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Marker_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Mask_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Path_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Pattern_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Polygon_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Polyline_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr RadialGradient_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Rect_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Set_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Svg_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Switch_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Symbol_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Text_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr TextPath_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Tspan_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr Use_ Fill String where
  attr Fill value = unsafeAttribute { key: "fill", value: prop' value }

instance Attr everything Fill Unit where
  attr Fill _ = unsafeAttribute
    { key: "fill", value: unset' }
