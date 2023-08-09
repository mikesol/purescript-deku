module Deku.DOM.Attr.Cursor where
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
data Cursor = Cursor
instance Attr Circle_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Circle_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Circle_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Defs_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Defs_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Defs_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Ellipse_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Ellipse_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Ellipse_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeBlend_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeBlend_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeBlend_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeColorMatrix_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeColorMatrix_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeColorMatrix_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeComponentTransfer_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeComponentTransfer_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeComponentTransfer_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeComposite_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeComposite_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeComposite_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeConvolveMatrix_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeConvolveMatrix_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeConvolveMatrix_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeDiffuseLighting_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeDiffuseLighting_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeDiffuseLighting_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeDisplacementMap_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeDisplacementMap_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeDisplacementMap_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeFlood_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeFlood_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeFlood_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeGaussianBlur_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeGaussianBlur_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeGaussianBlur_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeImage_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeImage_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeImage_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeMerge_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeMerge_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeMerge_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeMorphology_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeMorphology_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeMorphology_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeOffset_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeOffset_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeOffset_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeSpecularLighting_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeSpecularLighting_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeSpecularLighting_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeTile_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeTile_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeTile_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr FeTurbulence_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr FeTurbulence_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr FeTurbulence_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Filter_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Filter_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Filter_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr ForeignObject_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr ForeignObject_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr ForeignObject_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr G_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr G_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr G_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Image_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Image_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Image_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Line_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Line_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Line_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr LinearGradient_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr LinearGradient_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr LinearGradient_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Marker_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Marker_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Marker_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Path_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Path_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Path_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Pattern_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Pattern_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Pattern_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Polygon_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Polygon_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Polygon_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Polyline_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Polyline_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Polyline_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr RadialGradient_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr RadialGradient_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr RadialGradient_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Rect_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Rect_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Rect_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Svg_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Svg_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Svg_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Switch_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Switch_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Switch_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Symbol_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Symbol_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Symbol_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Text_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Text_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Text_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr TextPath_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr TextPath_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr TextPath_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Tspan_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Tspan_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Tspan_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr Use_ Cursor  String  where
  attr Cursor value = unsafeAttribute (  
    { key: "cursor", value: prop' value  } <$ _)
instance Attr Use_ Cursor (Event.Event Unit -> Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute (map (map (
    \value -> { key: "cursor", value: prop' value })) eventValue)
instance Attr Use_ Cursor (Event.Event  String ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "cursor", value: prop' value }
instance Attr everything Cursor  Unit  where
  attr Cursor _ = unsafeAttribute (  { key: "cursor", value: unset'  } <$ _)
instance Attr everything Cursor (Event.Event Unit -> Event.Event  Unit ) where
  attr Cursor eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "cursor", value: unset' })) eventValue)
instance Attr everything Cursor (Event.Event  Unit ) where
  attr Cursor eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "cursor", value: unset' }