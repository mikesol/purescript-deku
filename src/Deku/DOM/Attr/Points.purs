module Deku.DOM.Attr.Points where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Polyline (Polyline_)
import Deku.DOM.Elt.Polygon (Polygon_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Points = Points
instance Attr Polygon_ Points  String  where
  attr Points value = unsafeAttribute (  
    { key: "points", value: prop' value  } <$ _)
instance Attr Polygon_ Points (Event.Event Unit -> Event.Event  String ) where
  attr Points eventValue = unsafeAttribute (map (map (
    \value -> { key: "points", value: prop' value })) eventValue)
instance Attr Polygon_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "points", value: prop' value }
instance Attr Polyline_ Points  String  where
  attr Points value = unsafeAttribute (  
    { key: "points", value: prop' value  } <$ _)
instance Attr Polyline_ Points (Event.Event Unit -> Event.Event  String ) where
  attr Points eventValue = unsafeAttribute (map (map (
    \value -> { key: "points", value: prop' value })) eventValue)
instance Attr Polyline_ Points (Event.Event  String ) where
  attr Points eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "points", value: prop' value }
instance Attr everything Points  Unit  where
  attr Points _ = unsafeAttribute (  { key: "points", value: unset'  } <$ _)
instance Attr everything Points (Event.Event Unit -> Event.Event  Unit ) where
  attr Points eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "points", value: unset' })) eventValue)
instance Attr everything Points (Event.Event  Unit ) where
  attr Points eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "points", value: unset' }