module Deku.DOM.Attr.AriaExpanded where
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
data AriaExpanded = AriaExpanded
instance Attr Circle_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Circle_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Circle_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Ellipse_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr ForeignObject_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr G_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr G_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr G_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Line_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Line_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Line_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Marker_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Marker_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Marker_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Path_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Path_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Path_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Polygon_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Polygon_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Polygon_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Polyline_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Polyline_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Polyline_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Rect_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Rect_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Rect_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Svg_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Svg_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Svg_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Symbol_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Symbol_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Symbol_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Text_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Text_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Text_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr TextPath_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr TextPath_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr TextPath_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Tspan_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Tspan_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Tspan_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr Use_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr Use_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr Use_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr View_ AriaExpanded  String  where
  attr AriaExpanded value = unsafeAttribute (  
    { key: "aria-expanded", value: prop' value  } <$ _)
instance Attr View_ AriaExpanded (Event.Event Unit -> Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-expanded", value: prop' value })) eventValue)
instance Attr View_ AriaExpanded (Event.Event  String ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-expanded", value: prop' value }
instance Attr everything AriaExpanded  Unit  where
  attr AriaExpanded _ = unsafeAttribute (  
    { key: "aria-expanded", value: unset'  } <$ _)
instance Attr everything AriaExpanded (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaExpanded eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-expanded", value: unset' })) eventValue)
instance Attr everything AriaExpanded (Event.Event  Unit ) where
  attr AriaExpanded eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-expanded", value: unset' }