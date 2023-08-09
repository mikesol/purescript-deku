module Deku.DOM.Attr.FillOpacity where
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
data FillOpacity = FillOpacity
instance Attr Circle_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Circle_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Circle_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr ClipPath_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr ClipPath_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr ClipPath_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Defs_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Defs_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Defs_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Ellipse_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Ellipse_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Ellipse_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeBlend_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeBlend_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeBlend_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeColorMatrix_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeComponentTransfer_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeComposite_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeComposite_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeComposite_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeConvolveMatrix_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeDiffuseLighting_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeDisplacementMap_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeFlood_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeFlood_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeFlood_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeGaussianBlur_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeImage_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeImage_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeImage_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeMerge_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeMerge_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeMerge_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeMorphology_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeMorphology_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeMorphology_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeOffset_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeOffset_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeOffset_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeSpecularLighting_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeTile_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeTile_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeTile_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr FeTurbulence_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr FeTurbulence_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr FeTurbulence_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Filter_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Filter_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Filter_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr ForeignObject_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr ForeignObject_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr ForeignObject_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr G_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr G_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr G_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Image_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Image_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Image_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Line_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Line_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Line_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr LinearGradient_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr LinearGradient_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr LinearGradient_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Marker_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Marker_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Marker_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Mask_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Mask_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Mask_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Path_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Path_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Path_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Pattern_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Pattern_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Pattern_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Polygon_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Polygon_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Polygon_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Polyline_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Polyline_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Polyline_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr RadialGradient_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr RadialGradient_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr RadialGradient_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Rect_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Rect_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Rect_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Svg_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Svg_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Svg_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Switch_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Switch_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Switch_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Symbol_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Symbol_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Symbol_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Text_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Text_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Text_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr TextPath_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr TextPath_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr TextPath_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Tspan_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Tspan_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Tspan_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr Use_ FillOpacity  String  where
  attr FillOpacity value = unsafeAttribute (  
    { key: "fill-opacity", value: prop' value  } <$ _)
instance Attr Use_ FillOpacity (Event.Event Unit -> Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-opacity", value: prop' value })) eventValue)
instance Attr Use_ FillOpacity (Event.Event  String ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-opacity", value: prop' value }
instance Attr everything FillOpacity  Unit  where
  attr FillOpacity _ = unsafeAttribute (  
    { key: "fill-opacity", value: unset'  } <$ _)
instance Attr everything FillOpacity (Event.Event Unit -> Event.Event  Unit ) where
  attr FillOpacity eventValue = unsafeAttribute (map (map (
    \_ -> { key: "fill-opacity", value: unset' })) eventValue)
instance Attr everything FillOpacity (Event.Event  Unit ) where
  attr FillOpacity eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "fill-opacity", value: unset' }