module Deku.DOM.Attr.AriaSort where


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

data AriaSort = AriaSort

instance Attr Circle_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Circle_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Ellipse_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Ellipse_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr ForeignObject_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr ForeignObject_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr G_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr G_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Line_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Line_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Marker_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Marker_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Path_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Path_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Polygon_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Polygon_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Polyline_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Polyline_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Rect_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Rect_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Svg_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Svg_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Symbol_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Symbol_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Text_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Text_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr TextPath_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr TextPath_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Tspan_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Tspan_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr Use_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr Use_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr View_ AriaSort  String  where
  attr AriaSort value = unsafeAttribute $ Left $  
    { key: "aria-sort", value: prop' value }
instance Attr View_ AriaSort (Event.Event  String ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-sort", value: prop' value }


instance Attr everything AriaSort  Unit  where
  attr AriaSort _ = unsafeAttribute $ Left $  
    { key: "aria-sort", value: unset' }
instance Attr everything AriaSort (Event.Event  Unit ) where
  attr AriaSort eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "aria-sort", value: unset' }
