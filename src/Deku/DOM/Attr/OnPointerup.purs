module Deku.DOM.Attr.OnPointerup where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnPointerup = OnPointerup
instance Attr anything OnPointerup  Cb  where
  attr OnPointerup value = unsafeAttribute (  
    { key: "pointerup", value: cb' value  } <$ _)
instance Attr anything OnPointerup (Event.Event Unit -> Event.Event  Cb ) where
  attr OnPointerup eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerup", value: cb' value })) eventValue)
instance Attr anything OnPointerup (Event.Event  Cb ) where
  attr OnPointerup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerup", value: cb' value }
instance Attr anything OnPointerup  (Effect Unit)  where
  attr OnPointerup value = unsafeAttribute (  
    { key: "pointerup", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerup (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnPointerup eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerup", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnPointerup (Event.Event  (Effect Unit) ) where
  attr OnPointerup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerup  (Effect Boolean)  where
  attr OnPointerup value = unsafeAttribute (  
    { key: "pointerup", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerup (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnPointerup eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerup", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnPointerup (Event.Event  (Effect Boolean) ) where
  attr OnPointerup eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const value)) } 
instance Attr everything OnPointerup  Unit  where
  attr OnPointerup _ = unsafeAttribute (  
    { key: "pointerup", value: unset'  } <$ _)
instance Attr everything OnPointerup (Event.Event Unit -> Event.Event  Unit ) where
  attr OnPointerup eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pointerup", value: unset' })) eventValue)
instance Attr everything OnPointerup (Event.Event  Unit ) where
  attr OnPointerup eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointerup", value: unset' }