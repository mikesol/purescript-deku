module Deku.DOM.Attr.AriaErrormessage where


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

data AriaErrormessage = AriaErrormessage

instance Attr Circle_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Circle_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Ellipse_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Ellipse_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr ForeignObject_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr ForeignObject_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr G_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr G_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Line_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Line_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Marker_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Marker_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Path_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Path_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Polygon_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Polygon_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Polyline_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Polyline_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Rect_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Rect_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Svg_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Svg_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Symbol_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Symbol_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Text_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Text_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr TextPath_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr TextPath_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Tspan_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Tspan_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr Use_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr Use_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr View_ AriaErrormessage  String  where
  attr AriaErrormessage value = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: prop' value }
instance Attr View_ AriaErrormessage (Event.Event  String ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "aria-errormessage", value: prop' value }


instance Attr everything AriaErrormessage  Unit  where
  attr AriaErrormessage _ = unsafeAttribute $ Left $  
    { key: "aria-errormessage", value: unset' }
instance Attr everything AriaErrormessage (Event.Event  Unit ) where
  attr AriaErrormessage eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "aria-errormessage", value: unset' }
