module Deku.DOM.Attr.OnStalled where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnStalled = OnStalled
instance Attr anything OnStalled  Cb  where
  attr OnStalled value = unsafeAttribute (  
    { key: "stalled", value: cb' value  } <$ _)
instance Attr anything OnStalled (Event.Event Unit -> Event.Event  Cb ) where
  attr OnStalled eventValue = unsafeAttribute (map (map (
    \value -> { key: "stalled", value: cb' value })) eventValue)
instance Attr anything OnStalled (Event.Event  Cb ) where
  attr OnStalled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stalled", value: cb' value }
instance Attr anything OnStalled  (Effect Unit)  where
  attr OnStalled value = unsafeAttribute (  
    { key: "stalled", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnStalled (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnStalled eventValue = unsafeAttribute (map (map (
    \value -> { key: "stalled", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnStalled (Event.Event  (Effect Unit) ) where
  attr OnStalled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnStalled  (Effect Boolean)  where
  attr OnStalled value = unsafeAttribute (  
    { key: "stalled", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnStalled (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnStalled eventValue = unsafeAttribute (map (map (
    \value -> { key: "stalled", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnStalled (Event.Event  (Effect Boolean) ) where
  attr OnStalled eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "stalled", value: cb' (Cb (const value)) } 
instance Attr everything OnStalled  Unit  where
  attr OnStalled _ = unsafeAttribute (  
    { key: "stalled", value: unset'  } <$ _)
instance Attr everything OnStalled (Event.Event Unit -> Event.Event  Unit ) where
  attr OnStalled eventValue = unsafeAttribute (map (map (
    \_ -> { key: "stalled", value: unset' })) eventValue)
instance Attr everything OnStalled (Event.Event  Unit ) where
  attr OnStalled eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "stalled", value: unset' }