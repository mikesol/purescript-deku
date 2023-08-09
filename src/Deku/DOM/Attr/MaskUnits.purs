module Deku.DOM.Attr.MaskUnits where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data MaskUnits = MaskUnits
instance Attr Mask_ MaskUnits  String  where
  attr MaskUnits value = unsafeAttribute (  
    { key: "maskUnits", value: prop' value  } <$ _)
instance Attr Mask_ MaskUnits (Event.Event Unit -> Event.Event  String ) where
  attr MaskUnits eventValue = unsafeAttribute (map (map (
    \value -> { key: "maskUnits", value: prop' value })) eventValue)
instance Attr Mask_ MaskUnits (Event.Event  String ) where
  attr MaskUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "maskUnits", value: prop' value }
instance Attr everything MaskUnits  Unit  where
  attr MaskUnits _ = unsafeAttribute (  
    { key: "maskUnits", value: unset'  } <$ _)
instance Attr everything MaskUnits (Event.Event Unit -> Event.Event  Unit ) where
  attr MaskUnits eventValue = unsafeAttribute (map (map (
    \_ -> { key: "maskUnits", value: unset' })) eventValue)
instance Attr everything MaskUnits (Event.Event  Unit ) where
  attr MaskUnits eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "maskUnits", value: unset' }