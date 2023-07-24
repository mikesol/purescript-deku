module Deku.DOM.Attr.Opacity where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.AnimateMotion (AnimateMotion_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.Defs (Defs_)
import Deku.DOM.Elt.Desc (Desc_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.FeBlend (FeBlend_)
import Deku.DOM.Elt.FeColorMatrix (FeColorMatrix_)
import Deku.DOM.Elt.FeComponentTransfer (FeComponentTransfer_)
import Deku.DOM.Elt.FeComposite (FeComposite_)
import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)
import Deku.DOM.Elt.FeDistantLight (FeDistantLight_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeFlood (FeFlood_)
import Deku.DOM.Elt.FeFuncA (FeFuncA_)
import Deku.DOM.Elt.FeFuncB (FeFuncB_)
import Deku.DOM.Elt.FeFuncG (FeFuncG_)
import Deku.DOM.Elt.FeFuncR (FeFuncR_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeImage (FeImage_)
import Deku.DOM.Elt.FeMerge (FeMerge_)
import Deku.DOM.Elt.FeMergeNode (FeMergeNode_)
import Deku.DOM.Elt.FeMorphology (FeMorphology_)
import Deku.DOM.Elt.FeOffset (FeOffset_)
import Deku.DOM.Elt.FePointLight (FePointLight_)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.DOM.Elt.FeTile (FeTile_)
import Deku.DOM.Elt.FeTurbulence (FeTurbulence_)
import Deku.DOM.Elt.Filter (Filter_)
import Deku.DOM.Elt.FilterPrimitive (FilterPrimitive_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Metadata (Metadata_)
import Deku.DOM.Elt.Mpath (Mpath_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Set (Set_)
import Deku.DOM.Elt.Stop (Stop_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.View (View_)

data Opacity = Opacity

instance Deku.Attribute.Attr everything Opacity Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "opacity", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr AnimateMotion_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Circle_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Defs_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Desc_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Discard_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Ellipse_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeBlend_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComponentTransfer_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComposite_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeConvolveMatrix_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDiffuseLighting_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDisplacementMap_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDistantLight_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDropShadow_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFlood_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncA_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncB_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncG_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncR_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMerge_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMergeNode_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMorphology_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FePointLight_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTile_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTurbulence_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Filter_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr FilterPrimitive_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr ForeignObject_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr G_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Image_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Line_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Marker_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Metadata_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Mpath_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Path_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Pattern_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Polygon_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Polyline_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Rect_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Set_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Stop_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Svg_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Switch_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Symbol_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Text_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr Use_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'

instance Deku.Attribute.Attr View_ Opacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "opacity", value: _ } <<< Deku.Attribute.prop'
