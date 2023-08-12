module Deku.DOM.Attr.Filter where

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

data Filter = Filter

instance Attr Circle_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr ClipPath_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Defs_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Ellipse_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeBlend_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeColorMatrix_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeComponentTransfer_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeComposite_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeConvolveMatrix_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeDiffuseLighting_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeDisplacementMap_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeFlood_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeGaussianBlur_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeImage_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeMerge_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeMorphology_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeOffset_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeSpecularLighting_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeTile_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr FeTurbulence_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Filter_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr ForeignObject_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr G_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Image_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Line_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr LinearGradient_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Marker_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Mask_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Path_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Pattern_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Polygon_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Polyline_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr RadialGradient_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Rect_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Svg_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Switch_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Symbol_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Text_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr TextPath_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Tspan_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr Use_ Filter String where
  attr Filter value = unsafeAttribute { key: "filter", value: prop' value }

instance Attr everything Filter Unit where
  attr Filter _ = unsafeAttribute
    { key: "filter", value: unset' }
