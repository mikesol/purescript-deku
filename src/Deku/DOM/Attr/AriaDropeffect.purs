module Deku.DOM.Attr.AriaDropeffect where
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
data AriaDropeffect = AriaDropeffect
instance Attr Circle_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Circle_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Circle_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Ellipse_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr ForeignObject_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr G_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr G_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr G_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Line_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Line_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Line_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Marker_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Marker_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Marker_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Path_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Path_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Path_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Polygon_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Polygon_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Polygon_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Polyline_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Polyline_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Polyline_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Rect_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Rect_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Rect_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Svg_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Svg_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Svg_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Symbol_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Symbol_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Symbol_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Text_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Text_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Text_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr TextPath_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr TextPath_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr TextPath_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Tspan_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Tspan_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Tspan_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr Use_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr Use_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr Use_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr View_ AriaDropeffect  String  where
  attr AriaDropeffect value = unsafeAttribute (  
    { key: "aria-dropeffect", value: prop' value  } <$ _)
instance Attr View_ AriaDropeffect (Event.Event Unit -> Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-dropeffect", value: prop' value })) eventValue)
instance Attr View_ AriaDropeffect (Event.Event  String ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-dropeffect", value: prop' value }
instance Attr everything AriaDropeffect  Unit  where
  attr AriaDropeffect _ = unsafeAttribute (  
    { key: "aria-dropeffect", value: unset'  } <$ _)
instance Attr everything AriaDropeffect (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaDropeffect eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-dropeffect", value: unset' })) eventValue)
instance Attr everything AriaDropeffect (Event.Event  Unit ) where
  attr AriaDropeffect eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-dropeffect", value: unset' }