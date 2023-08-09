module Deku.DOM.Attr.AriaValuetext where
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
data AriaValuetext = AriaValuetext
instance Attr Circle_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Circle_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Circle_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Ellipse_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr ForeignObject_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr G_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr G_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr G_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Line_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Line_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Line_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Marker_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Marker_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Marker_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Path_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Path_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Path_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Polygon_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Polygon_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Polygon_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Polyline_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Polyline_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Polyline_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Rect_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Rect_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Rect_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Svg_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Svg_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Svg_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Symbol_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Symbol_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Symbol_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Text_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Text_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Text_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr TextPath_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr TextPath_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr TextPath_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Tspan_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Tspan_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Tspan_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr Use_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr Use_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr Use_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr View_ AriaValuetext  String  where
  attr AriaValuetext value = unsafeAttribute (  
    { key: "aria-valuetext", value: prop' value  } <$ _)
instance Attr View_ AriaValuetext (Event.Event Unit -> Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-valuetext", value: prop' value })) eventValue)
instance Attr View_ AriaValuetext (Event.Event  String ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-valuetext", value: prop' value }
instance Attr everything AriaValuetext  Unit  where
  attr AriaValuetext _ = unsafeAttribute (  
    { key: "aria-valuetext", value: unset'  } <$ _)
instance Attr everything AriaValuetext (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaValuetext eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-valuetext", value: unset' })) eventValue)
instance Attr everything AriaValuetext (Event.Event  Unit ) where
  attr AriaValuetext eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-valuetext", value: unset' }