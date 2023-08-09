module Deku.DOM.Attr.AriaSelected where
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
data AriaSelected = AriaSelected
instance Attr Circle_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Circle_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Circle_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Ellipse_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr ForeignObject_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr G_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr G_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr G_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Line_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Line_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Line_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Marker_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Marker_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Marker_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Path_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Path_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Path_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Polygon_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Polygon_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Polygon_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Polyline_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Polyline_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Polyline_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Rect_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Rect_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Rect_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Svg_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Svg_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Svg_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Symbol_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Symbol_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Symbol_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Text_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Text_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Text_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr TextPath_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr TextPath_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr TextPath_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Tspan_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Tspan_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Tspan_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr Use_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr Use_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr Use_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr View_ AriaSelected  String  where
  attr AriaSelected value = unsafeAttribute (  
    { key: "aria-selected", value: prop' value  } <$ _)
instance Attr View_ AriaSelected (Event.Event Unit -> Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-selected", value: prop' value })) eventValue)
instance Attr View_ AriaSelected (Event.Event  String ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-selected", value: prop' value }
instance Attr everything AriaSelected  Unit  where
  attr AriaSelected _ = unsafeAttribute (  
    { key: "aria-selected", value: unset'  } <$ _)
instance Attr everything AriaSelected (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaSelected eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-selected", value: unset' })) eventValue)
instance Attr everything AriaSelected (Event.Event  Unit ) where
  attr AriaSelected eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-selected", value: unset' }