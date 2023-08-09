module Deku.DOM.Attr.AriaPressed where
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
data AriaPressed = AriaPressed
instance Attr Circle_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Circle_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Circle_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Ellipse_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr ForeignObject_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr G_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr G_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr G_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Line_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Line_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Line_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Marker_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Marker_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Marker_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Path_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Path_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Path_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Polygon_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Polygon_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Polygon_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Polyline_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Polyline_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Polyline_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Rect_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Rect_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Rect_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Svg_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Svg_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Svg_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Symbol_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Symbol_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Symbol_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Text_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Text_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Text_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr TextPath_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr TextPath_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr TextPath_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Tspan_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Tspan_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Tspan_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr Use_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr Use_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr Use_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr View_ AriaPressed  String  where
  attr AriaPressed value = unsafeAttribute (  
    { key: "aria-pressed", value: prop' value  } <$ _)
instance Attr View_ AriaPressed (Event.Event Unit -> Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-pressed", value: prop' value })) eventValue)
instance Attr View_ AriaPressed (Event.Event  String ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-pressed", value: prop' value }
instance Attr everything AriaPressed  Unit  where
  attr AriaPressed _ = unsafeAttribute (  
    { key: "aria-pressed", value: unset'  } <$ _)
instance Attr everything AriaPressed (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaPressed eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-pressed", value: unset' })) eventValue)
instance Attr everything AriaPressed (Event.Event  Unit ) where
  attr AriaPressed eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-pressed", value: unset' }