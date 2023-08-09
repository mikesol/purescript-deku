module Deku.DOM.Attr.MarkerWidth where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data MarkerWidth = MarkerWidth
instance Attr Marker_ MarkerWidth  String  where
  attr MarkerWidth value = unsafeAttribute (  
    { key: "markerWidth", value: prop' value  } <$ _)
instance Attr Marker_ MarkerWidth (Event.Event Unit -> Event.Event  String ) where
  attr MarkerWidth eventValue = unsafeAttribute (map (map (
    \value -> { key: "markerWidth", value: prop' value })) eventValue)
instance Attr Marker_ MarkerWidth (Event.Event  String ) where
  attr MarkerWidth eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "markerWidth", value: prop' value }
instance Attr everything MarkerWidth  Unit  where
  attr MarkerWidth _ = unsafeAttribute (  
    { key: "markerWidth", value: unset'  } <$ _)
instance Attr everything MarkerWidth (Event.Event Unit -> Event.Event  Unit ) where
  attr MarkerWidth eventValue = unsafeAttribute (map (map (
    \_ -> { key: "markerWidth", value: unset' })) eventValue)
instance Attr everything MarkerWidth (Event.Event  Unit ) where
  attr MarkerWidth eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "markerWidth", value: unset' }