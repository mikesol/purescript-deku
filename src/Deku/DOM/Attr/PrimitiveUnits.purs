module Deku.DOM.Attr.PrimitiveUnits where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Filter (Filter_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data PrimitiveUnits = PrimitiveUnits
instance Attr Filter_ PrimitiveUnits  String  where
  attr PrimitiveUnits value = unsafeAttribute (  
    { key: "primitiveUnits", value: prop' value  } <$ _)
instance Attr Filter_ PrimitiveUnits (Event.Event Unit -> Event.Event  String ) where
  attr PrimitiveUnits eventValue = unsafeAttribute (map (map (
    \value -> { key: "primitiveUnits", value: prop' value })) eventValue)
instance Attr Filter_ PrimitiveUnits (Event.Event  String ) where
  attr PrimitiveUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "primitiveUnits", value: prop' value }
instance Attr everything PrimitiveUnits  Unit  where
  attr PrimitiveUnits _ = unsafeAttribute (  
    { key: "primitiveUnits", value: unset'  } <$ _)
instance Attr everything PrimitiveUnits (Event.Event Unit -> Event.Event  Unit ) where
  attr PrimitiveUnits eventValue = unsafeAttribute (map (map (
    \_ -> { key: "primitiveUnits", value: unset' })) eventValue)
instance Attr everything PrimitiveUnits (Event.Event  Unit ) where
  attr PrimitiveUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "primitiveUnits", value: unset' }