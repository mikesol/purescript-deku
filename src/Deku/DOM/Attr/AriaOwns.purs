module Deku.DOM.Attr.AriaOwns where


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

data AriaOwns = AriaOwns

instance Attr Circle_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Circle_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Ellipse_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Ellipse_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr ForeignObject_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr ForeignObject_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr G_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr G_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Line_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Line_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Marker_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Marker_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Path_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Path_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Polygon_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Polygon_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Polyline_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Polyline_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Rect_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Rect_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Svg_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Svg_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Symbol_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Symbol_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Text_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Text_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr TextPath_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr TextPath_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Tspan_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Tspan_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr Use_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr Use_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr View_ AriaOwns  String  where
  attr AriaOwns value = unsafeAttribute $ Left $  
    { key: "aria-owns", value: prop' value }
instance Attr View_ AriaOwns (Event.Event  String ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "aria-owns", value: prop' value }


instance Attr everything AriaOwns  Unit  where
  attr AriaOwns _ = unsafeAttribute $ Left $  
    { key: "aria-owns", value: unset' }
instance Attr everything AriaOwns (Event.Event  Unit ) where
  attr AriaOwns eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "aria-owns", value: unset' }
