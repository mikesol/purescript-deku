module Deku.DOM.Attr.AriaValuenow where
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
data AriaValuenow = AriaValuenow
instance Attr Circle_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Circle_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Circle_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Ellipse_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr ForeignObject_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr G_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr G_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr G_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Line_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Line_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Line_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Marker_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Marker_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Marker_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Path_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Path_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Path_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Polygon_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Polygon_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Polygon_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Polyline_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Polyline_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Polyline_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Rect_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Rect_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Rect_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Svg_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Svg_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Svg_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Symbol_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Symbol_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Symbol_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Text_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Text_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Text_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr TextPath_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr TextPath_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr TextPath_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Tspan_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Tspan_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Tspan_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr Use_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr Use_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr Use_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr View_ AriaValuenow  String  where
  attr AriaValuenow value = unsafeAttribute (  
    { key: "aria-valuenow", value: prop' value  } <$ _)
instance Attr View_ AriaValuenow (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuenow", value: prop' value })) eventValue)
instance Attr View_ AriaValuenow (Event.Event  String ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuenow", value: prop' value }
instance Attr everything AriaValuenow  Unit  where
  attr AriaValuenow _ = unsafeAttribute (  
    { key: "aria-valuenow", value: unset'  } <$ _)
instance Attr everything AriaValuenow (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaValuenow eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-valuenow", value: unset' })) eventValue)
instance Attr everything AriaValuenow (Event.Event  Unit ) where
  attr AriaValuenow eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-valuenow", value: unset' }