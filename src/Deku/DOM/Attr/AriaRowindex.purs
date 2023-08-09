module Deku.DOM.Attr.AriaRowindex where
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
data AriaRowindex = AriaRowindex
instance Attr Circle_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Circle_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Circle_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Ellipse_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr ForeignObject_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr G_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr G_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr G_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Line_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Line_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Line_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Marker_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Marker_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Marker_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Path_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Path_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Path_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Polygon_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Polygon_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Polygon_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Polyline_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Polyline_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Polyline_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Rect_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Rect_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Rect_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Svg_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Svg_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Svg_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Symbol_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Symbol_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Symbol_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Text_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Text_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Text_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr TextPath_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr TextPath_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr TextPath_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Tspan_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Tspan_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Tspan_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr Use_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr Use_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr Use_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr View_ AriaRowindex  String  where
  attr AriaRowindex value = unsafeAttribute (  
    { key: "aria-rowindex", value: prop' value  } <$ _)
instance Attr View_ AriaRowindex (Event.Event Unit -> Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-rowindex", value: prop' value })) eventValue)
instance Attr View_ AriaRowindex (Event.Event  String ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowindex", value: prop' value }
instance Attr everything AriaRowindex  Unit  where
  attr AriaRowindex _ = unsafeAttribute (  
    { key: "aria-rowindex", value: unset'  } <$ _)
instance Attr everything AriaRowindex (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaRowindex eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-rowindex", value: unset' })) eventValue)
instance Attr everything AriaRowindex (Event.Event  Unit ) where
  attr AriaRowindex eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-rowindex", value: unset' }