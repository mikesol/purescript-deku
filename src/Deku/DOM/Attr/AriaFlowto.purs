module Deku.DOM.Attr.AriaFlowto where
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
data AriaFlowto = AriaFlowto
instance Attr Circle_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Circle_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Circle_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Ellipse_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Ellipse_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr ForeignObject_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr ForeignObject_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr G_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr G_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr G_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Line_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Line_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Line_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Marker_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Marker_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Marker_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Path_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Path_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Path_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Polygon_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Polygon_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Polygon_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Polyline_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Polyline_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Polyline_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Rect_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Rect_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Rect_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Svg_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Svg_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Svg_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Symbol_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Symbol_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Symbol_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Text_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Text_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Text_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr TextPath_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr TextPath_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr TextPath_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Tspan_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Tspan_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Tspan_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr Use_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr Use_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr Use_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr View_ AriaFlowto  String  where
  attr AriaFlowto value = unsafeAttribute (  
    { key: "aria-flowto", value: prop' value  } <$ _)
instance Attr View_ AriaFlowto (Event.Event Unit -> Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \value -> { key: "aria-flowto", value: prop' value })) eventValue)
instance Attr View_ AriaFlowto (Event.Event  String ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-flowto", value: prop' value }
instance Attr everything AriaFlowto  Unit  where
  attr AriaFlowto _ = unsafeAttribute (  
    { key: "aria-flowto", value: unset'  } <$ _)
instance Attr everything AriaFlowto (Event.Event Unit -> Event.Event  Unit ) where
  attr AriaFlowto eventValue = unsafeAttribute (map (map (
    \_ -> { key: "aria-flowto", value: unset' })) eventValue)
instance Attr everything AriaFlowto (Event.Event  Unit ) where
  attr AriaFlowto eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-flowto", value: unset' }