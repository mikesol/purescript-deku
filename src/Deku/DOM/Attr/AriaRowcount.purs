module Deku.DOM.Attr.AriaRowcount where
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
data AriaRowcount = AriaRowcount
instance Attr Circle_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Circle_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Circle_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Ellipse_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr ForeignObject_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr G_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr G_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr G_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Line_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Line_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Line_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Marker_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Marker_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Marker_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Path_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Path_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Path_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Polygon_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Polygon_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Polygon_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Polyline_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Polyline_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Polyline_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Rect_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Rect_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Rect_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Svg_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Svg_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Svg_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Symbol_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Symbol_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Symbol_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Text_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Text_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Text_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr TextPath_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr TextPath_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr TextPath_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Tspan_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Tspan_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Tspan_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr Use_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr Use_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr Use_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr View_ AriaRowcount  String  where
  attr AriaRowcount value = unsafeAttribute (  
    { key: "aria-rowcount", value: prop' value  } <$ _)
instance Attr View_ AriaRowcount (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowcount", value: prop' value })) eventValue)
instance Attr View_ AriaRowcount (Event.Event  String ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowcount", value: prop' value }
instance Attr everything AriaRowcount  Unit  where
  attr AriaRowcount _ = unsafeAttribute (  
    { key: "aria-rowcount", value: unset'  } <$ _)
instance Attr everything AriaRowcount (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaRowcount eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-rowcount", value: unset' })) eventValue)
instance Attr everything AriaRowcount (Event.Event  Unit ) where
  attr AriaRowcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-rowcount", value: unset' }