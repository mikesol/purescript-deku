module Deku.DOM.Attr.OnSlotchange where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnSlotchange = OnSlotchange
instance Attr anything OnSlotchange  Cb  where
  attr OnSlotchange value = unsafeAttribute (  
    { key: "slotchange", value: cb' value  } <$ _)
instance Attr anything OnSlotchange (Event.Event Unit -> Event.Event  Cb ) where
  attr OnSlotchange eventValue = unsafeAttribute (map (map (
    \value -> { key: "slotchange", value: cb' value })) eventValue)
instance Attr anything OnSlotchange (Event.Event  Cb ) where
  attr OnSlotchange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "slotchange", value: cb' value }
instance Attr anything OnSlotchange  (Effect Unit)  where
  attr OnSlotchange value = unsafeAttribute (  
    { key: "slotchange", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnSlotchange (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnSlotchange eventValue = unsafeAttribute (map (map (
    \value -> { key: "slotchange", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnSlotchange (Event.Event  (Effect Unit) ) where
  attr OnSlotchange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSlotchange  (Effect Boolean)  where
  attr OnSlotchange value = unsafeAttribute (  
    { key: "slotchange", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnSlotchange (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnSlotchange eventValue = unsafeAttribute (map (map (
    \value -> { key: "slotchange", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnSlotchange (Event.Event  (Effect Boolean) ) where
  attr OnSlotchange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "slotchange", value: cb' (Cb (const value)) } 
instance Attr everything OnSlotchange  Unit  where
  attr OnSlotchange _ = unsafeAttribute (  
    { key: "slotchange", value: unset'  } <$ _)
instance Attr everything OnSlotchange (Event.Event Unit -> Event.Event  Unit ) where
  attr OnSlotchange eventValue = unsafeAttribute (map (map (
    \_ -> { key: "slotchange", value: unset' })) eventValue)
instance Attr everything OnSlotchange (Event.Event  Unit ) where
  attr OnSlotchange eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "slotchange", value: unset' }