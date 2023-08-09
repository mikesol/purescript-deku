module Deku.DOM.Attr.OnInvalid where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnInvalid = OnInvalid
instance Attr anything OnInvalid  Cb  where
  attr OnInvalid value = unsafeAttribute (  
    { key: "invalid", value: cb' value  } <$ _)
instance Attr anything OnInvalid (Event.Event Unit -> Event.Event  Cb ) where
  attr OnInvalid eventValue = unsafeAttribute (map (map (
    \value -> { key: "invalid", value: cb' value })) eventValue)
instance Attr anything OnInvalid (Event.Event  Cb ) where
  attr OnInvalid eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "invalid", value: cb' value }
instance Attr anything OnInvalid  (Effect Unit)  where
  attr OnInvalid value = unsafeAttribute (  
    { key: "invalid", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnInvalid (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnInvalid eventValue = unsafeAttribute (map (map (
    \value -> { key: "invalid", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnInvalid (Event.Event  (Effect Unit) ) where
  attr OnInvalid eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInvalid  (Effect Boolean)  where
  attr OnInvalid value = unsafeAttribute (  
    { key: "invalid", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnInvalid (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnInvalid eventValue = unsafeAttribute (map (map (
    \value -> { key: "invalid", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnInvalid (Event.Event  (Effect Boolean) ) where
  attr OnInvalid eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const value)) } 
instance Attr everything OnInvalid  Unit  where
  attr OnInvalid _ = unsafeAttribute (  
    { key: "invalid", value: unset'  } <$ _)
instance Attr everything OnInvalid (Event.Event Unit -> Event.Event  Unit ) where
  attr OnInvalid eventValue = unsafeAttribute (map (map (
    \_ -> { key: "invalid", value: unset' })) eventValue)
instance Attr everything OnInvalid (Event.Event  Unit ) where
  attr OnInvalid eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "invalid", value: unset' }