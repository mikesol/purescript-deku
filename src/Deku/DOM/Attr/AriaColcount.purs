module Deku.DOM.Attr.AriaColcount where


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

data AriaColcount = AriaColcount

instance Attr Circle_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Circle_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Ellipse_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr ForeignObject_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr G_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr G_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Line_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Line_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Marker_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Marker_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Path_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Path_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Polygon_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Polygon_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Polyline_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Polyline_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Rect_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Rect_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Svg_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Svg_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Symbol_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Symbol_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Text_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Text_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr TextPath_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr TextPath_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Tspan_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Tspan_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr Use_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr Use_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr View_ AriaColcount  String  where
  attr AriaColcount value = unsafeAttribute (  
    { key: "aria-colcount", value: prop' value  } <$ _)
instance Attr View_ AriaColcount (Event.Event  String ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-colcount", value: prop' value }


instance Attr everything AriaColcount  Unit  where
  attr AriaColcount _ = unsafeAttribute (  
    { key: "aria-colcount", value: unset'  } <$ _)
instance Attr everything AriaColcount (Event.Event  Unit ) where
  attr AriaColcount eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-colcount", value: unset' }
