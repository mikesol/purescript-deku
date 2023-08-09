module Deku.DOM.Attr.StrokeLinecap where
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
data StrokeLinecap = StrokeLinecap
instance Attr Circle_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Circle_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Circle_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr ClipPath_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr ClipPath_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr ClipPath_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Defs_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Defs_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Defs_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Ellipse_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Ellipse_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Ellipse_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeBlend_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeBlend_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeBlend_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeColorMatrix_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeComponentTransfer_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeComposite_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeComposite_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeComposite_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeConvolveMatrix_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeDiffuseLighting_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeDisplacementMap_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeFlood_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeFlood_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeFlood_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeGaussianBlur_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeImage_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeImage_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeImage_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeMerge_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeMerge_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeMerge_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeMorphology_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeMorphology_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeMorphology_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeOffset_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeOffset_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeOffset_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeSpecularLighting_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeTile_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeTile_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeTile_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr FeTurbulence_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr FeTurbulence_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr FeTurbulence_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Filter_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Filter_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Filter_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr ForeignObject_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr ForeignObject_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr ForeignObject_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr G_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr G_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr G_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Image_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Image_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Image_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Line_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Line_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Line_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr LinearGradient_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr LinearGradient_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr LinearGradient_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Marker_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Marker_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Marker_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Mask_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Mask_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Mask_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Path_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Path_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Path_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Pattern_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Pattern_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Pattern_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Polygon_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Polygon_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Polygon_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Polyline_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Polyline_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Polyline_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr RadialGradient_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr RadialGradient_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr RadialGradient_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Rect_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Rect_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Rect_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Svg_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Svg_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Svg_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Switch_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Switch_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Switch_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Symbol_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Symbol_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Symbol_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Text_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Text_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Text_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr TextPath_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr TextPath_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr TextPath_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Tspan_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Tspan_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Tspan_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr Use_ StrokeLinecap  String  where
  attr StrokeLinecap value = unsafeAttribute (  
    { key: "stroke-linecap", value: prop' value  } <$ _)
instance Attr Use_ StrokeLinecap (Event.Event Unit -> Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \value -> { key: "stroke-linecap", value: prop' value })) eventValue)
instance Attr Use_ StrokeLinecap (Event.Event  String ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stroke-linecap", value: prop' value }
instance Attr everything StrokeLinecap  Unit  where
  attr StrokeLinecap _ = unsafeAttribute (  
    { key: "stroke-linecap", value: unset'  } <$ _)
instance Attr everything StrokeLinecap (Event.Event Unit -> Event.Event  Unit ) where
  attr StrokeLinecap eventValue = unsafeAttribute (map (map (
    \_ -> { key: "stroke-linecap", value: unset' })) eventValue)
instance Attr everything StrokeLinecap (Event.Event  Unit ) where
  attr StrokeLinecap eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "stroke-linecap", value: unset' }