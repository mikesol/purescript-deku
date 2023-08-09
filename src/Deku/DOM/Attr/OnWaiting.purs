module Deku.DOM.Attr.OnWaiting where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnWaiting = OnWaiting
instance Attr anything OnWaiting  Cb  where
  attr OnWaiting value = unsafeAttribute (  
    { key: "waiting", value: cb' value  } <$ _)
instance Attr anything OnWaiting (Event.Event Unit -> Event.Event  Cb ) where
  attr OnWaiting eventValue = unsafeAttribute (map (map (
    \value -> { key: "waiting", value: cb' value })) eventValue)
instance Attr anything OnWaiting (Event.Event  Cb ) where
  attr OnWaiting eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "waiting", value: cb' value }
instance Attr anything OnWaiting  (Effect Unit)  where
  attr OnWaiting value = unsafeAttribute (  
    { key: "waiting", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnWaiting (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnWaiting eventValue = unsafeAttribute (map (map (
    \value -> { key: "waiting", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnWaiting (Event.Event  (Effect Unit) ) where
  attr OnWaiting eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWaiting  (Effect Boolean)  where
  attr OnWaiting value = unsafeAttribute (  
    { key: "waiting", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnWaiting (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnWaiting eventValue = unsafeAttribute (map (map (
    \value -> { key: "waiting", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnWaiting (Event.Event  (Effect Boolean) ) where
  attr OnWaiting eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const value)) } 
instance Attr everything OnWaiting  Unit  where
  attr OnWaiting _ = unsafeAttribute (  
    { key: "waiting", value: unset'  } <$ _)
instance Attr everything OnWaiting (Event.Event Unit -> Event.Event  Unit ) where
  attr OnWaiting eventValue = unsafeAttribute (map (map (
    \_ -> { key: "waiting", value: unset' })) eventValue)
instance Attr everything OnWaiting (Event.Event  Unit ) where
  attr OnWaiting eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "waiting", value: unset' }