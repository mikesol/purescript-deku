module Deku.DOM.Attr.Display where


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
import Deku.DOM.Elt.Stop (Stop_)
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

data Display = Display

instance Attr Circle_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Circle_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr ClipPath_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr ClipPath_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Defs_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Defs_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Ellipse_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Ellipse_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeBlend_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeBlend_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeColorMatrix_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeColorMatrix_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeComponentTransfer_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeComponentTransfer_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeComposite_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeComposite_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeConvolveMatrix_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeConvolveMatrix_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeDiffuseLighting_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeDiffuseLighting_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeDisplacementMap_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeDisplacementMap_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeFlood_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeFlood_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeGaussianBlur_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeGaussianBlur_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeImage_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeImage_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeMerge_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeMerge_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeMorphology_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeMorphology_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeOffset_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeOffset_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeSpecularLighting_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeSpecularLighting_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeTile_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeTile_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr FeTurbulence_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr FeTurbulence_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Filter_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Filter_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr ForeignObject_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr ForeignObject_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr G_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr G_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Image_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Image_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Line_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Line_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr LinearGradient_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr LinearGradient_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Marker_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Marker_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Mask_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Mask_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Path_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Path_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Pattern_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Pattern_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Polygon_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Polygon_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Polyline_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Polyline_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr RadialGradient_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr RadialGradient_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Rect_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Rect_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Stop_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Stop_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Svg_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Svg_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Switch_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Switch_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Symbol_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Symbol_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Text_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Text_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr TextPath_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr TextPath_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Tspan_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Tspan_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr Use_ Display  String  where
  attr Display value = unsafeAttribute $ Left $  
    { key: "display", value: prop' value }
instance Attr Use_ Display (Event.Event  String ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "display", value: prop' value }


instance Attr everything Display  Unit  where
  attr Display _ = unsafeAttribute $ Left $  { key: "display", value: unset' }
instance Attr everything Display (Event.Event  Unit ) where
  attr Display eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "display", value: unset' }
