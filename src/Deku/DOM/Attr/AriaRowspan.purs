module Deku.DOM.Attr.AriaRowspan where


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

data AriaRowspan = AriaRowspan

instance Attr Circle_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Circle_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Ellipse_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Ellipse_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr ForeignObject_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr ForeignObject_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr G_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr G_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Line_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Line_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Marker_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Marker_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Path_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Path_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Polygon_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Polygon_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Polyline_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Polyline_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Rect_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Rect_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Svg_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Svg_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Symbol_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Symbol_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Text_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Text_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr TextPath_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr TextPath_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Tspan_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Tspan_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr Use_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr Use_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr View_ AriaRowspan  String  where
  attr AriaRowspan value = unsafeAttribute (  
    { key: "aria-rowspan", value: prop' value  } <$ _)
instance Attr View_ AriaRowspan (Event.Event  String ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "aria-rowspan", value: prop' value }


instance Attr everything AriaRowspan  Unit  where
  attr AriaRowspan _ = unsafeAttribute (  
    { key: "aria-rowspan", value: unset'  } <$ _)
instance Attr everything AriaRowspan (Event.Event  Unit ) where
  attr AriaRowspan eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "aria-rowspan", value: unset' }
