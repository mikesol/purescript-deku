module Deku.DOM.Attr.AriaOrientation where


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

data AriaOrientation = AriaOrientation

instance Attr Circle_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Circle_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Ellipse_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr ForeignObject_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr G_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr G_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Line_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Line_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Marker_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Marker_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Path_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Path_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Polygon_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Polygon_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Polyline_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Polyline_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Rect_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Rect_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Svg_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Svg_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Symbol_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Symbol_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Text_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Text_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr TextPath_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr TextPath_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Tspan_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Tspan_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr Use_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr Use_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr View_ AriaOrientation  String  where
  attr AriaOrientation value = unsafeAttribute (  
    { key: "aria-orientation", value: prop' value  } <$ _)
instance Attr View_ AriaOrientation (Event.Event  String ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "aria-orientation", value: prop' value }


instance Attr everything AriaOrientation  Unit  where
  attr AriaOrientation _ = unsafeAttribute (  
    { key: "aria-orientation", value: unset'  } <$ _)
instance Attr everything AriaOrientation (Event.Event  Unit ) where
  attr AriaOrientation eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "aria-orientation", value: unset' }
