module Deku.DOM.Attr.AriaModal where


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

data AriaModal = AriaModal

instance Attr Circle_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Circle_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Ellipse_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr ForeignObject_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr G_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr G_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Line_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Line_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Marker_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Marker_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Path_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Path_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Polygon_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Polygon_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Polyline_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Polyline_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Rect_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Rect_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Svg_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Svg_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Symbol_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Symbol_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Text_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Text_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr TextPath_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr TextPath_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Tspan_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Tspan_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr Use_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr Use_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr View_ AriaModal  String  where
  attr AriaModal value = unsafeAttribute (  
    { key: "aria-modal", value: prop' value  } <$ _)
instance Attr View_ AriaModal (Event.Event  String ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-modal", value: prop' value }


instance Attr everything AriaModal  Unit  where
  attr AriaModal _ = unsafeAttribute (  
    { key: "aria-modal", value: unset'  } <$ _)
instance Attr everything AriaModal (Event.Event  Unit ) where
  attr AriaModal eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-modal", value: unset' }
