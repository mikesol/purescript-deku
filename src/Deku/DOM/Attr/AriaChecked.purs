module Deku.DOM.Attr.AriaChecked where
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
data AriaChecked = AriaChecked
instance Attr Circle_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Circle_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Circle_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Ellipse_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr ForeignObject_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr G_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr G_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr G_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Line_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Line_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Line_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Marker_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Marker_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Marker_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Path_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Path_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Path_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Polygon_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Polygon_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Polygon_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Polyline_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Polyline_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Polyline_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Rect_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Rect_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Rect_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Svg_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Svg_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Svg_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Symbol_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Symbol_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Symbol_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Text_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Text_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Text_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr TextPath_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr TextPath_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr TextPath_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Tspan_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Tspan_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Tspan_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr Use_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr Use_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr Use_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr View_ AriaChecked  String  where
  attr AriaChecked value = unsafeAttribute (  
    { key: "aria-checked", value: prop' value  } <$ _)
instance Attr View_ AriaChecked (Event.Event Unit -> Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-checked", value: prop' value })) eventValue)
instance Attr View_ AriaChecked (Event.Event  String ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-checked", value: prop' value }
instance Attr everything AriaChecked  Unit  where
  attr AriaChecked _ = unsafeAttribute (  
    { key: "aria-checked", value: unset'  } <$ _)
instance Attr everything AriaChecked (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaChecked eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-checked", value: unset' })) eventValue)
instance Attr everything AriaChecked (Event.Event  Unit ) where
  attr AriaChecked eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-checked", value: unset' }