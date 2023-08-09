module Deku.DOM.Attr.Transform where
import Prelude
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
data Transform = Transform
instance Attr Circle_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Circle_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Circle_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr ClipPath_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr ClipPath_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr ClipPath_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Defs_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Defs_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Defs_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Ellipse_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Ellipse_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Ellipse_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeBlend_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeBlend_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeBlend_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeColorMatrix_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeComponentTransfer_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeComposite_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeComposite_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeComposite_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeConvolveMatrix_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeDiffuseLighting_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeDisplacementMap_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeFlood_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeFlood_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeFlood_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeGaussianBlur_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeImage_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeImage_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeImage_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeMerge_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeMerge_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeMerge_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeMorphology_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeMorphology_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeMorphology_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeOffset_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeOffset_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeOffset_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeSpecularLighting_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeTile_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeTile_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeTile_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr FeTurbulence_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr FeTurbulence_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr FeTurbulence_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Filter_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Filter_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Filter_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr ForeignObject_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr ForeignObject_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr ForeignObject_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr G_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr G_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr G_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Image_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Image_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Image_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Line_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Line_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Line_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr LinearGradient_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr LinearGradient_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr LinearGradient_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Marker_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Marker_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Marker_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Mask_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Mask_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Mask_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Path_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Path_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Path_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Pattern_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Pattern_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Pattern_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Polygon_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Polygon_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Polygon_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Polyline_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Polyline_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Polyline_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr RadialGradient_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr RadialGradient_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr RadialGradient_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Rect_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Rect_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Rect_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Svg_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Svg_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Svg_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Switch_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Switch_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Switch_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Symbol_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Symbol_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Symbol_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Text_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Text_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Text_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr TextPath_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr TextPath_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr TextPath_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Tspan_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Tspan_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Tspan_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr Use_ Transform  String  where
  attr Transform value = unsafeAttribute (  
    { key: "transform", value: prop' value  } <$ _)
instance Attr Use_ Transform (Event.Event Unit -> Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \value -> { key: "transform", value: prop' value })) eventValue)
instance Attr Use_ Transform (Event.Event  String ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "transform", value: prop' value }
instance Attr everything Transform  Unit  where
  attr Transform _ = unsafeAttribute (  
    { key: "transform", value: unset'  } <$ _)
instance Attr everything Transform (Event.Event Unit -> Event.Event  Unit ) where
  attr Transform eventValue = unsafeAttribute (map (map (
    \_ -> { key: "transform", value: unset' })) eventValue)
instance Attr everything Transform (Event.Event  Unit ) where
  attr Transform eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "transform", value: unset' }