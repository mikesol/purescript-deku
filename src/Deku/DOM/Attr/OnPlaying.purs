module Deku.DOM.Attr.OnPlaying where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnPlaying = OnPlaying
instance Attr anything OnPlaying  Cb  where
  attr OnPlaying value = unsafeAttribute (  
    { key: "playing", value: cb' value  } <$ _)
instance Attr anything OnPlaying (Event.Event Unit -> Event.Event  Cb ) where
  attr OnPlaying eventValue = unsafeAttribute (map (map (
    \value -> { key: "playing", value: cb' value })) eventValue)
instance Attr anything OnPlaying (Event.Event  Cb ) where
  attr OnPlaying eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "playing", value: cb' value }
instance Attr anything OnPlaying  (Effect Unit)  where
  attr OnPlaying value = unsafeAttribute (  
    { key: "playing", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnPlaying (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnPlaying eventValue = unsafeAttribute (map (map (
    \value -> { key: "playing", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnPlaying (Event.Event  (Effect Unit) ) where
  attr OnPlaying eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPlaying  (Effect Boolean)  where
  attr OnPlaying value = unsafeAttribute (  
    { key: "playing", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnPlaying (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnPlaying eventValue = unsafeAttribute (map (map (
    \value -> { key: "playing", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnPlaying (Event.Event  (Effect Boolean) ) where
  attr OnPlaying eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "playing", value: cb' (Cb (const value)) } 
instance Attr everything OnPlaying  Unit  where
  attr OnPlaying _ = unsafeAttribute (  
    { key: "playing", value: unset'  } <$ _)
instance Attr everything OnPlaying (Event.Event Unit -> Event.Event  Unit ) where
  attr OnPlaying eventValue = unsafeAttribute (map (map (
    \_ -> { key: "playing", value: unset' })) eventValue)
instance Attr everything OnPlaying (Event.Event  Unit ) where
  attr OnPlaying eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "playing", value: unset' }