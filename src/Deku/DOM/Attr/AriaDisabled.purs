module Deku.DOM.Attr.AriaDisabled where


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

data AriaDisabled = AriaDisabled

instance Attr Circle_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Circle_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Ellipse_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr ForeignObject_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr G_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr G_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Line_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Line_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Marker_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Marker_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Path_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Path_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Polygon_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Polygon_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Polyline_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Polyline_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Rect_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Rect_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Svg_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Svg_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Symbol_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Symbol_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Text_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Text_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr TextPath_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr TextPath_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Tspan_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Tspan_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr Use_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr Use_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr View_ AriaDisabled  String  where
  attr AriaDisabled value = unsafeAttribute (  
    { key: "aria-disabled", value: prop' value  } <$ _)
instance Attr View_ AriaDisabled (Event.Event  String ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-disabled", value: prop' value }


instance Attr everything AriaDisabled  Unit  where
  attr AriaDisabled _ = unsafeAttribute (  
    { key: "aria-disabled", value: unset'  } <$ _)
instance Attr everything AriaDisabled (Event.Event  Unit ) where
  attr AriaDisabled eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-disabled", value: unset' }
