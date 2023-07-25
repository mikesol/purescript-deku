module Deku.DOM.Attr.ClipPath where

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

data ClipPath = ClipPath

instance Deku.Attribute.Attr everything ClipPath Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "clip-path", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr AnimateMotion_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr AnimateTransform_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Circle_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Defs_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Desc_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Discard_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Ellipse_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeBlend_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeColorMatrix_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComponentTransfer_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeComposite_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeConvolveMatrix_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDiffuseLighting_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDisplacementMap_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDistantLight_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeDropShadow_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFlood_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncA_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncB_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncG_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeFuncR_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeImage_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMerge_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMergeNode_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeMorphology_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeOffset_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FePointLight_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpecularLighting_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeSpotLight_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTile_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeTurbulence_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Filter_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FilterPrimitive_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr ForeignObject_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr G_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Image_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Line_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr LinearGradient_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Marker_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Metadata_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Mpath_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Path_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Pattern_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Polygon_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Polyline_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Rect_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Set_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Stop_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Svg_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Switch_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Symbol_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Text_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr TextPath_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Tspan_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr Use_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr View_ ClipPath String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "clip-path", value: _ } <<<
    Deku.Attribute.prop'
