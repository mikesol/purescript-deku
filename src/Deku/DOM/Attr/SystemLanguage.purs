module Deku.DOM.Attr.SystemLanguage where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Switch (Switch_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Pattern (Pattern_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Mask (Mask_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Image (Image_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Discard (Discard_)
import Deku.DOM.Elt.ClipPath (ClipPath_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data SystemLanguage = SystemLanguage
instance Attr AnimateTransform_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr AnimateTransform_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr AnimateTransform_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Circle_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Circle_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Circle_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr ClipPath_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr ClipPath_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr ClipPath_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Discard_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Discard_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Discard_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Ellipse_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Ellipse_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Ellipse_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr ForeignObject_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr ForeignObject_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr ForeignObject_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr G_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr G_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr G_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Image_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Image_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Image_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Line_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Line_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Line_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Marker_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Marker_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Marker_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Mask_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Mask_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Mask_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Path_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Path_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Path_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Pattern_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Pattern_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Pattern_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Polygon_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Polygon_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Polygon_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Polyline_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Polyline_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Polyline_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Rect_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Rect_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Rect_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Svg_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Svg_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Svg_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Switch_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Switch_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Switch_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Text_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Text_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Text_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr TextPath_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr TextPath_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr TextPath_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Tspan_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Tspan_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Tspan_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr Use_ SystemLanguage  String  where
  attr SystemLanguage value = unsafeAttribute (  
    { key: "systemLanguage", value: prop' value  } <$ _)
instance Attr Use_ SystemLanguage (Event.Event Unit -> Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \value -> { key: "systemLanguage", value: prop' value })) eventValue)
instance Attr Use_ SystemLanguage (Event.Event  String ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "systemLanguage", value: prop' value }
instance Attr everything SystemLanguage  Unit  where
  attr SystemLanguage _ = unsafeAttribute (  
    { key: "systemLanguage", value: unset'  } <$ _)
instance Attr everything SystemLanguage (Event.Event Unit -> Event.Event  Unit ) where
  attr SystemLanguage eventValue = unsafeAttribute (map (map (
    \_ -> { key: "systemLanguage", value: unset' })) eventValue)
instance Attr everything SystemLanguage (Event.Event  Unit ) where
  attr SystemLanguage eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "systemLanguage", value: unset' }