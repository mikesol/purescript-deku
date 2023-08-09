module Deku.DOM.Attr.AriaRequired where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.View (View_)
import Deku.DOM.Elt.Use (Use_)
import Deku.DOM.Elt.Tspan (Tspan_)
import Deku.DOM.Elt.TextPath (TextPath_)
import Deku.DOM.Elt.Text (Text_)
import Deku.DOM.Elt.Symbol (Symbol_)
import Deku.DOM.Elt.Svg (Svg_)
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Marker (Marker_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.G (G_)
import Deku.DOM.Elt.ForeignObject (ForeignObject_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data AriaRequired = AriaRequired
instance Attr Circle_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Circle_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Circle_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Ellipse_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr ForeignObject_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr G_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr G_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr G_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Line_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Line_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Line_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Marker_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Marker_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Marker_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Path_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Path_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Path_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Polygon_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Polygon_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Polygon_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Polyline_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Polyline_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Polyline_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Rect_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Rect_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Rect_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Svg_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Svg_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Svg_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Symbol_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Symbol_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Symbol_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Text_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Text_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Text_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr TextPath_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr TextPath_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr TextPath_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Tspan_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Tspan_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Tspan_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr Use_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr Use_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr Use_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr View_ AriaRequired  String  where
  attr AriaRequired value = unsafeAttribute (  
    { key: "aria-required", value: prop' value  } <$ _)
instance Attr View_ AriaRequired (Event.Event Unit -> Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-required", value: prop' value })) eventValue)
instance Attr View_ AriaRequired (Event.Event  String ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-required", value: prop' value }
instance Attr everything AriaRequired  Unit  where
  attr AriaRequired _ = unsafeAttribute (  
    { key: "aria-required", value: unset'  } <$ _)
instance Attr everything AriaRequired (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaRequired eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-required", value: unset' })) eventValue)
instance Attr everything AriaRequired (Event.Event  Unit ) where
  attr AriaRequired eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-required", value: unset' }