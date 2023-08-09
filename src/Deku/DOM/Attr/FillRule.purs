module Deku.DOM.Attr.FillRule where
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
data FillRule = FillRule
instance Attr Circle_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Circle_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Circle_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr ClipPath_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr ClipPath_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr ClipPath_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Defs_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Defs_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Defs_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Ellipse_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Ellipse_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Ellipse_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeBlend_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeBlend_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeBlend_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeColorMatrix_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeComponentTransfer_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeComposite_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeComposite_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeComposite_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeConvolveMatrix_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeDiffuseLighting_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeDisplacementMap_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeFlood_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeFlood_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeFlood_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeGaussianBlur_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeImage_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeImage_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeImage_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeMerge_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeMerge_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeMerge_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeMorphology_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeMorphology_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeMorphology_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeOffset_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeOffset_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeOffset_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeSpecularLighting_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeTile_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeTile_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeTile_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr FeTurbulence_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr FeTurbulence_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr FeTurbulence_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Filter_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Filter_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Filter_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr ForeignObject_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr ForeignObject_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr ForeignObject_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr G_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr G_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr G_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Image_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Image_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Image_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Line_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Line_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Line_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr LinearGradient_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr LinearGradient_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr LinearGradient_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Marker_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Marker_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Marker_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Mask_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Mask_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Mask_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Path_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Path_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Path_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Pattern_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Pattern_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Pattern_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Polygon_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Polygon_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Polygon_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Polyline_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Polyline_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Polyline_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr RadialGradient_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr RadialGradient_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr RadialGradient_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Rect_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Rect_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Rect_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Svg_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Svg_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Svg_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Switch_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Switch_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Switch_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Symbol_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Symbol_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Symbol_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Text_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Text_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Text_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr TextPath_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr TextPath_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr TextPath_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Tspan_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Tspan_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Tspan_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr Use_ FillRule  String  where
  attr FillRule value = unsafeAttribute (  
    { key: "fill-rule", value: prop' value  } <$ _)
instance Attr Use_ FillRule (Event.Event Unit -> Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute (map (map (
    \value -> { key: "fill-rule", value: prop' value })) eventValue)
instance Attr Use_ FillRule (Event.Event  String ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "fill-rule", value: prop' value }
instance Attr everything FillRule  Unit  where
  attr FillRule _ = unsafeAttribute (  
    { key: "fill-rule", value: unset'  } <$ _)
instance Attr everything FillRule (Event.Event Unit -> Event.Event  Unit ) where
  attr FillRule eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "fill-rule", value: unset' })) eventValue)
instance Attr everything FillRule (Event.Event  Unit ) where
  attr FillRule eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "fill-rule", value: unset' }