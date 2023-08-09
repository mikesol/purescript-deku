module Deku.DOM.Attr.Coords where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Area (Area_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Coords = Coords
instance Attr Area_ Coords  String  where
  attr Coords value = unsafeAttribute (  
    { key: "coords", value: prop' value  } <$ _)
instance Attr Area_ Coords (Event.Event Unit -> Event.Event  String ) where
  attr Coords eventValue = unsafeAttribute (map (map (
    \value -> { key: "coords", value: prop' value })) eventValue)
instance Attr Area_ Coords (Event.Event  String ) where
  attr Coords eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "coords", value: prop' value }
instance Attr everything Coords  Unit  where
  attr Coords _ = unsafeAttribute (  { key: "coords", value: unset'  } <$ _)
instance Attr everything Coords (Event.Event Unit -> Event.Event  Unit ) where
  attr Coords eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "coords", value: unset' })) eventValue)
instance Attr everything Coords (Event.Event  Unit ) where
  attr Coords eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "coords", value: unset' }