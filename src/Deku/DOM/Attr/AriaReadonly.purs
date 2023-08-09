module Deku.DOM.Attr.AriaReadonly where
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
data AriaReadonly = AriaReadonly
instance Attr Circle_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Circle_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Circle_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Ellipse_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr ForeignObject_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr G_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr G_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr G_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Line_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Line_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Line_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Marker_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Marker_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Marker_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Path_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Path_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Path_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Polygon_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Polygon_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Polygon_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Polyline_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Polyline_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Polyline_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Rect_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Rect_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Rect_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Svg_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Svg_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Svg_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Symbol_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Symbol_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Symbol_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Text_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Text_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Text_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr TextPath_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr TextPath_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr TextPath_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Tspan_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Tspan_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Tspan_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr Use_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr Use_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr Use_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr View_ AriaReadonly  String  where
  attr AriaReadonly value = unsafeAttribute (  
    { key: "aria-readonly", value: prop' value  } <$ _)
instance Attr View_ AriaReadonly (Event.Event Unit -> Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-readonly", value: prop' value })) eventValue)
instance Attr View_ AriaReadonly (Event.Event  String ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-readonly", value: prop' value }
instance Attr everything AriaReadonly  Unit  where
  attr AriaReadonly _ = unsafeAttribute (  
    { key: "aria-readonly", value: unset'  } <$ _)
instance Attr everything AriaReadonly (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaReadonly eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-readonly", value: unset' })) eventValue)
instance Attr everything AriaReadonly (Event.Event  Unit ) where
  attr AriaReadonly eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-readonly", value: unset' }