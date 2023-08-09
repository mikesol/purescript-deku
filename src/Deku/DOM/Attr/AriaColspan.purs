module Deku.DOM.Attr.AriaColspan where
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
data AriaColspan = AriaColspan
instance Attr Circle_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Circle_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Circle_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Ellipse_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr ForeignObject_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr G_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr G_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr G_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Line_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Line_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Line_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Marker_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Marker_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Marker_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Path_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Path_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Path_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Polygon_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Polygon_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Polygon_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Polyline_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Polyline_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Polyline_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Rect_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Rect_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Rect_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Svg_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Svg_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Svg_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Symbol_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Symbol_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Symbol_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Text_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Text_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Text_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr TextPath_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr TextPath_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr TextPath_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Tspan_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Tspan_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Tspan_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr Use_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr Use_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr Use_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr View_ AriaColspan  String  where
  attr AriaColspan value = unsafeAttribute (  
    { key: "aria-colspan", value: prop' value  } <$ _)
instance Attr View_ AriaColspan (Event.Event Unit -> Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-colspan", value: prop' value })) eventValue)
instance Attr View_ AriaColspan (Event.Event  String ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colspan", value: prop' value }
instance Attr everything AriaColspan  Unit  where
  attr AriaColspan _ = unsafeAttribute (  
    { key: "aria-colspan", value: unset'  } <$ _)
instance Attr everything AriaColspan (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaColspan eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-colspan", value: unset' })) eventValue)
instance Attr everything AriaColspan (Event.Event  Unit ) where
  attr AriaColspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-colspan", value: unset' }