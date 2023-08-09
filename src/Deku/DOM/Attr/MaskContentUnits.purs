module Deku.DOM.Attr.MaskContentUnits where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Mask (Mask_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data MaskContentUnits = MaskContentUnits
instance Attr Mask_ MaskContentUnits  String  where
  attr MaskContentUnits value = unsafeAttribute (  
    { key: "maskContentUnits", value: prop' value  } <$ _)
instance Attr Mask_ MaskContentUnits (Event.Event Unit -> Event.Event  String ) where
  attr MaskContentUnits eventValue = unsafeAttribute (map (map ( \value -> { key: "maskContentUnits", value: prop' value })) eventValue)
instance Attr Mask_ MaskContentUnits (Event.Event  String ) where
  attr MaskContentUnits eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "maskContentUnits", value: prop' value }
instance Attr everything MaskContentUnits  Unit  where
  attr MaskContentUnits _ = unsafeAttribute (  
    { key: "maskContentUnits", value: unset'  } <$ _)
instance Attr everything MaskContentUnits (Event.Event Unit -> Event.Event  Unit ) where
  attr MaskContentUnits eventValue = unsafeAttribute (map (map ( \_ -> { key: "maskContentUnits", value: unset' })) eventValue)
instance Attr everything MaskContentUnits (Event.Event  Unit ) where
  attr MaskContentUnits eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "maskContentUnits", value: unset' }