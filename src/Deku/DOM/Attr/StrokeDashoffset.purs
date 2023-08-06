module Deku.DOM.Attr.StrokeDashoffset where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
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

data StrokeDashoffset = StrokeDashoffset

instance Attr Circle_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Circle_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr ClipPath_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr ClipPath_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Defs_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Defs_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Ellipse_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Ellipse_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeBlend_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeBlend_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeColorMatrix_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeColorMatrix_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeComponentTransfer_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeComponentTransfer_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeComposite_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeComposite_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeConvolveMatrix_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeDiffuseLighting_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeDisplacementMap_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeDisplacementMap_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeFlood_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeFlood_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeGaussianBlur_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeGaussianBlur_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeImage_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeImage_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeMerge_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeMerge_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeMorphology_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeMorphology_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeOffset_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeOffset_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeSpecularLighting_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeSpecularLighting_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeTile_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeTile_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr FeTurbulence_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr FeTurbulence_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Filter_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Filter_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr ForeignObject_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr ForeignObject_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr G_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr G_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Image_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Image_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Line_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Line_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr LinearGradient_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr LinearGradient_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Marker_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Marker_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Mask_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Mask_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Path_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Path_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Pattern_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Pattern_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Polygon_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Polygon_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Polyline_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Polyline_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr RadialGradient_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr RadialGradient_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Rect_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Rect_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Svg_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Svg_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Switch_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Switch_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Symbol_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Symbol_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Text_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Text_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr TextPath_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr TextPath_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Tspan_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Tspan_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr Use_ StrokeDashoffset  String  where
  attr StrokeDashoffset value = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: prop' value }
instance Attr Use_ StrokeDashoffset (Event.Event  String ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "stroke-dashoffset", value: prop' value }


instance Attr everything StrokeDashoffset  Unit  where
  attr StrokeDashoffset _ = unsafeAttribute $ Left $  
    { key: "stroke-dashoffset", value: unset' }
instance Attr everything StrokeDashoffset (Event.Event  Unit ) where
  attr StrokeDashoffset eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "stroke-dashoffset", value: unset' }
