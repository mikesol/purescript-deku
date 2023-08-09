module Deku.DOM.Attr.Inputmode where
import Prelude
import FRP.Event as Event
import Deku.DOM.Elt.Textarea (Textarea_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')
data Inputmode = Inputmode
instance Attr Textarea_ Inputmode  String  where
  attr Inputmode value = unsafeAttribute (  
    { key: "inputmode", value: prop' value  } <$ _)
instance Attr Textarea_ Inputmode (Event.Event Unit -> Event.Event  String ) where
  attr Inputmode eventValue = unsafeAttribute (map (map (
    \value -> { key: "inputmode", value: prop' value })) eventValue)
instance Attr Textarea_ Inputmode (Event.Event  String ) where
  attr Inputmode eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "inputmode", value: prop' value }
instance Attr everything Inputmode  Unit  where
  attr Inputmode _ = unsafeAttribute (  
    { key: "inputmode", value: unset'  } <$ _)
instance Attr everything Inputmode (Event.Event Unit -> Event.Event  Unit ) where
  attr Inputmode eventValue = unsafeAttribute (map (map (
    \_ -> { key: "inputmode", value: unset' })) eventValue)
instance Attr everything Inputmode (Event.Event  Unit ) where
  attr Inputmode eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "inputmode", value: unset' }