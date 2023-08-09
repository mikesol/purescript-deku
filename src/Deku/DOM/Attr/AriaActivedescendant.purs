module Deku.DOM.Attr.AriaActivedescendant where
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
data AriaActivedescendant = AriaActivedescendant
instance Attr Circle_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Circle_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Circle_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Ellipse_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr ForeignObject_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr G_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr G_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr G_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Line_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Line_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Line_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Marker_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Marker_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Marker_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Path_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Path_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Path_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Polygon_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Polygon_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Polygon_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Polyline_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Polyline_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Polyline_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Rect_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Rect_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Rect_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Svg_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Svg_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Svg_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Symbol_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Symbol_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Symbol_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Text_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Text_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Text_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr TextPath_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr TextPath_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr TextPath_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Tspan_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Tspan_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Tspan_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr Use_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr Use_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr Use_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr View_ AriaActivedescendant  String  where
  attr AriaActivedescendant value = unsafeAttribute (  
    { key: "aria-activedescendant", value: prop' value  } <$ _)
instance Attr View_ AriaActivedescendant (Event.Event Unit -> Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \value ->
      { key: "aria-activedescendant", value: prop' value })) eventValue)
instance Attr View_ AriaActivedescendant (Event.Event  String ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "aria-activedescendant", value: prop' value }
instance Attr everything AriaActivedescendant  Unit  where
  attr AriaActivedescendant _ = unsafeAttribute (  
    { key: "aria-activedescendant", value: unset'  } <$ _)
instance Attr everything AriaActivedescendant (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaActivedescendant eventValue = unsafeAttribute (map (map ( \_ -> { key: "aria-activedescendant", value: unset' })) eventValue)
instance Attr everything AriaActivedescendant (Event.Event  Unit ) where
  attr AriaActivedescendant eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "aria-activedescendant", value: unset' }