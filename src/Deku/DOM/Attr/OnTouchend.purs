module Deku.DOM.Attr.OnTouchend where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnTouchend = OnTouchend
instance Attr anything OnTouchend  Cb  where
  attr OnTouchend value = unsafeAttribute (  
    { key: "touchend", value: cb' value  } <$ _)
instance Attr anything OnTouchend (Event.Event Unit -> Event.Event  Cb ) where
  attr OnTouchend eventValue = unsafeAttribute (map (map (
    \value -> { key: "touchend", value: cb' value })) eventValue)
instance Attr anything OnTouchend (Event.Event  Cb ) where
  attr OnTouchend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchend", value: cb' value }
instance Attr anything OnTouchend  (Effect Unit)  where
  attr OnTouchend value = unsafeAttribute (  
    { key: "touchend", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnTouchend (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnTouchend eventValue = unsafeAttribute (map (map (
    \value -> { key: "touchend", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnTouchend (Event.Event  (Effect Unit) ) where
  attr OnTouchend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchend  (Effect Boolean)  where
  attr OnTouchend value = unsafeAttribute (  
    { key: "touchend", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnTouchend (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnTouchend eventValue = unsafeAttribute (map (map (
    \value -> { key: "touchend", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnTouchend (Event.Event  (Effect Boolean) ) where
  attr OnTouchend eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const value)) } 
instance Attr everything OnTouchend  Unit  where
  attr OnTouchend _ = unsafeAttribute (  
    { key: "touchend", value: unset'  } <$ _)
instance Attr everything OnTouchend (Event.Event Unit -> Event.Event  Unit ) where
  attr OnTouchend eventValue = unsafeAttribute (map (map (
    \_ -> { key: "touchend", value: unset' })) eventValue)
instance Attr everything OnTouchend (Event.Event  Unit ) where
  attr OnTouchend eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "touchend", value: unset' }