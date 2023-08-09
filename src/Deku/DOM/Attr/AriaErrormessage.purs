module Deku.DOM.Attr.AriaErrormessage where
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
data AriaErrormessage = AriaErrormessage
instance Attr Circle_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Circle_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Circle_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Ellipse_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr ForeignObject_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr G_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr G_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr G_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Line_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Line_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Line_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Marker_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Marker_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Marker_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Path_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Path_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Path_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Polygon_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Polygon_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Polygon_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Polyline_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Polyline_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Polyline_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Rect_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Rect_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Rect_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Svg_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Svg_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Svg_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Symbol_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Symbol_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Symbol_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Text_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Text_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Text_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr TextPath_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr TextPath_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr TextPath_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Tspan_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Tspan_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Tspan_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr Use_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr Use_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr Use_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr View_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute (  
    { key: "aria-errormessage", value: prop' value  } <$ _)
instance Attr View_ AriaErrormessage (Event.Event Unit -> Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \value -> { key: "aria-errormessage", value: prop' value })) eventValue)
instance Attr View_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }
instance Attr everything AriaErrormessage  Unit  where
  attr AriaErrormessage _ = unsafeAttribute (  
    { key: "aria-errormessage", value: unset'  } <$ _)
instance Attr everything AriaErrormessage (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaErrormessage eventValue = unsafeAttribute (map (map ( \_ -> { key: "aria-errormessage", value: unset' })) eventValue)
instance Attr everything AriaErrormessage (Event.Event  Unit ) where
  attr AriaErrormessage eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "aria-errormessage", value: unset' }