module Deku.DOM.Attr.OnPointerleave where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnPointerleave = OnPointerleave
instance Attr anything OnPointerleave  Cb  where
  attr OnPointerleave value = unsafeAttribute (  
    { key: "pointerleave", value: cb' value  } <$ _)
instance Attr anything OnPointerleave (Event.Event Unit -> Event.Event  Cb ) where
  attr OnPointerleave eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerleave", value: cb' value })) eventValue)
instance Attr anything OnPointerleave (Event.Event  Cb ) where
  attr OnPointerleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerleave", value: cb' value }
instance Attr anything OnPointerleave  (Effect Unit)  where
  attr OnPointerleave value = unsafeAttribute (  
    { key: "pointerleave", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPointerleave (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnPointerleave eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerleave", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnPointerleave (Event.Event  (Effect Unit) ) where
  attr OnPointerleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerleave  (Effect Boolean)  where
  attr OnPointerleave value = unsafeAttribute (  
    { key: "pointerleave", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPointerleave (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnPointerleave eventValue = unsafeAttribute (map (map (
    \value -> { key: "pointerleave", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnPointerleave (Event.Event  (Effect Boolean) ) where
  attr OnPointerleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const value)) } 
instance Attr everything OnPointerleave  Unit  where
  attr OnPointerleave _ = unsafeAttribute (  
    { key: "pointerleave", value: unset'  } <$ _)
instance Attr everything OnPointerleave (Event.Event Unit -> Event.Event  Unit ) where
  attr OnPointerleave eventValue = unsafeAttribute (map (map (
    \_ -> { key: "pointerleave", value: unset' })) eventValue)
instance Attr everything OnPointerleave (Event.Event  Unit ) where
  attr OnPointerleave eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "pointerleave", value: unset' }