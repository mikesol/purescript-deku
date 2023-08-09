module Deku.DOM.Attr.MarkerHeight where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Marker (Marker_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data MarkerHeight = MarkerHeight
instance Attr Marker_ MarkerHeight  String  where
  attr MarkerHeight value = unsafeAttribute (  
    { key: "markerHeight", value: prop' value  } <$ _)
instance Attr Marker_ MarkerHeight (Event.Event Unit -> Event.Event  String ) where
  attr MarkerHeight eventValue = unsafeAttribute (map (map (
    \value -> { key: "markerHeight", value: prop' value })) eventValue)
instance Attr Marker_ MarkerHeight (Event.Event  String ) where
  attr MarkerHeight eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "markerHeight", value: prop' value }
instance Attr everything MarkerHeight  Unit  where
  attr MarkerHeight _ = unsafeAttribute (  
    { key: "markerHeight", value: unset'  } <$ _)
instance Attr everything MarkerHeight (Event.Event Unit -> Event.Event  Unit ) where
  attr MarkerHeight eventValue = unsafeAttribute (map (map (
    \_ -> { key: "markerHeight", value: unset' })) eventValue)
instance Attr everything MarkerHeight (Event.Event  Unit ) where
  attr MarkerHeight eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "markerHeight", value: unset' }