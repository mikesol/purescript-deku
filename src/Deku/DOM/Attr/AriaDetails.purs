module Deku.DOM.Attr.AriaDetails where
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
data AriaDetails = AriaDetails
instance Attr Circle_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Circle_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Circle_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Ellipse_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr ForeignObject_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr G_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr G_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr G_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Line_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Line_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Line_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Marker_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Marker_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Marker_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Path_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Path_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Path_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Polygon_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Polygon_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Polygon_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Polyline_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Polyline_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Polyline_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Rect_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Rect_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Rect_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Svg_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Svg_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Svg_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Symbol_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Symbol_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Symbol_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Text_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Text_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Text_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr TextPath_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr TextPath_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr TextPath_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Tspan_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Tspan_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Tspan_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr Use_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr Use_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr Use_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr View_ AriaDetails  String  where
  attr AriaDetails value = unsafeAttribute (  
    { key: "aria-details", value: prop' value  } <$ _)
instance Attr View_ AriaDetails (Event.Event Unit -> Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-details", value: prop' value })) eventValue)
instance Attr View_ AriaDetails (Event.Event  String ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-details", value: prop' value }
instance Attr everything AriaDetails  Unit  where
  attr AriaDetails _ = unsafeAttribute (  
    { key: "aria-details", value: unset'  } <$ _)
instance Attr everything AriaDetails (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaDetails eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-details", value: unset' })) eventValue)
instance Attr everything AriaDetails (Event.Event  Unit ) where
  attr AriaDetails eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-details", value: unset' }