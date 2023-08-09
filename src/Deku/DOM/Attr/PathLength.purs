module Deku.DOM.Attr.PathLength where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Rect (Rect_)
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.DOM.Elt.Path (Path_)
import Deku.DOM.Elt.Line (Line_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data PathLength = PathLength
instance Attr Circle_ PathLength  String  where
  attr PathLength value = unsafeAttribute (  
    { key: "pathLength", value: prop' value  } <$ _)
instance Attr Circle_ PathLength (Event.Event Unit -> Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "pathLength", value: prop' value })) eventValue)
instance Attr Circle_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pathLength", value: prop' value }
instance Attr Ellipse_ PathLength  String  where
  attr PathLength value = unsafeAttribute (  
    { key: "pathLength", value: prop' value  } <$ _)
instance Attr Ellipse_ PathLength (Event.Event Unit -> Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "pathLength", value: prop' value })) eventValue)
instance Attr Ellipse_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pathLength", value: prop' value }
instance Attr Line_ PathLength  String  where
  attr PathLength value = unsafeAttribute (  
    { key: "pathLength", value: prop' value  } <$ _)
instance Attr Line_ PathLength (Event.Event Unit -> Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "pathLength", value: prop' value })) eventValue)
instance Attr Line_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pathLength", value: prop' value }
instance Attr Path_ PathLength  String  where
  attr PathLength value = unsafeAttribute (  
    { key: "pathLength", value: prop' value  } <$ _)
instance Attr Path_ PathLength (Event.Event Unit -> Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "pathLength", value: prop' value })) eventValue)
instance Attr Path_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pathLength", value: prop' value }
instance Attr Polygon_ PathLength  String  where
  attr PathLength value = unsafeAttribute (  
    { key: "pathLength", value: prop' value  } <$ _)
instance Attr Polygon_ PathLength (Event.Event Unit -> Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "pathLength", value: prop' value })) eventValue)
instance Attr Polygon_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pathLength", value: prop' value }
instance Attr Polyline_ PathLength  String  where
  attr PathLength value = unsafeAttribute (  
    { key: "pathLength", value: prop' value  } <$ _)
instance Attr Polyline_ PathLength (Event.Event Unit -> Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "pathLength", value: prop' value })) eventValue)
instance Attr Polyline_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pathLength", value: prop' value }
instance Attr Rect_ PathLength  String  where
  attr PathLength value = unsafeAttribute (  
    { key: "pathLength", value: prop' value  } <$ _)
instance Attr Rect_ PathLength (Event.Event Unit -> Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \value -> { key: "pathLength", value: prop' value })) eventValue)
instance Attr Rect_ PathLength (Event.Event  String ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pathLength", value: prop' value }
instance Attr everything PathLength  Unit  where
  attr PathLength _ = unsafeAttribute (  
    { key: "pathLength", value: unset'  } <$ _)
instance Attr everything PathLength (Event.Event Unit -> Event.Event  Unit ) where
  attr PathLength eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pathLength", value: unset' })) eventValue)
instance Attr everything PathLength (Event.Event  Unit ) where
  attr PathLength eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pathLength", value: unset' }