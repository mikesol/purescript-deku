module Deku.DOM.Attr.PointerEvents where

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

data PointerEvents = PointerEvents

instance Attr Circle_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Defs_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Ellipse_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeBlend_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeColorMatrix_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeComponentTransfer_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeComposite_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeConvolveMatrix_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeDiffuseLighting_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeDisplacementMap_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeFlood_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeGaussianBlur_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeImage_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeMerge_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeMorphology_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeOffset_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeSpecularLighting_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeTile_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr FeTurbulence_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Filter_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr ForeignObject_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr G_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Image_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Line_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr LinearGradient_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Marker_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Path_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Pattern_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Polygon_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Polyline_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr RadialGradient_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Rect_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Svg_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Switch_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Symbol_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Text_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr TextPath_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Tspan_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr Use_ PointerEvents String where
  attr PointerEvents value = unsafeAttribute
    { key: "pointer-events", value: prop' value }

instance Attr everything PointerEvents Unit where
  attr PointerEvents _ = unsafeAttribute
    { key: "pointer-events", value: unset' }
