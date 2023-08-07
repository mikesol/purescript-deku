module Deku.DOM.Attr.AriaLive where


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

data AriaLive = AriaLive

instance Attr Circle_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Circle_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Ellipse_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr ForeignObject_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr G_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr G_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Line_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Line_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Marker_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Marker_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Path_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Path_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Polygon_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Polygon_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Polyline_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Polyline_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Rect_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Rect_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Svg_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Svg_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Symbol_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Symbol_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Text_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Text_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr TextPath_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr TextPath_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Tspan_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Tspan_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr Use_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr Use_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr View_ AriaLive  String  where
  attr AriaLive value = unsafeAttribute (  
    { key: "aria-live", value: prop' value  } <$ _)
instance Attr View_ AriaLive (Event.Event  String ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-live", value: prop' value }


instance Attr everything AriaLive  Unit  where
  attr AriaLive _ = unsafeAttribute (  
    { key: "aria-live", value: unset'  } <$ _)
instance Attr everything AriaLive (Event.Event  Unit ) where
  attr AriaLive eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "aria-live", value: unset' }
