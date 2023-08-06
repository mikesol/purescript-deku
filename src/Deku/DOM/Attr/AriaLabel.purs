module Deku.DOM.Attr.AriaLabel where


import Prelude
import Data.Either (Either(..))
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

data AriaLabel = AriaLabel

instance Attr Circle_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Circle_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Ellipse_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Ellipse_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr ForeignObject_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr ForeignObject_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr G_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr G_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Line_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Line_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Marker_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Marker_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Path_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Path_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Polygon_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Polygon_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Polyline_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Polyline_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Rect_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Rect_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Svg_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Svg_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Symbol_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Symbol_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Text_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Text_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr TextPath_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr TextPath_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Tspan_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Tspan_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr Use_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr Use_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr View_ AriaLabel  String  where
  attr AriaLabel value = unsafeAttribute $ Left $  
    { key: "aria-label", value: prop' value }
instance Attr View_ AriaLabel (Event.Event  String ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-label", value: prop' value }


instance Attr everything AriaLabel  Unit  where
  attr AriaLabel _ = unsafeAttribute $ Left $  
    { key: "aria-label", value: unset' }
instance Attr everything AriaLabel (Event.Event  Unit ) where
  attr AriaLabel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "aria-label", value: unset' }
