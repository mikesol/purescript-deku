module Deku.DOM.Attr.OnError where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnError = OnError
instance Attr anything OnError  Cb  where
  attr OnError value = unsafeAttribute (  
    { key: "error", value: cb' value  } <$ _)
instance Attr anything OnError (Event.Event Unit -> Event.Event  Cb ) where
  attr OnError eventValue = unsafeAttribute (map (map (
    \value -> { key: "error", value: cb' value })) eventValue)
instance Attr anything OnError (Event.Event  Cb ) where
  attr OnError eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "error", value: cb' value }
instance Attr anything OnError  (Effect Unit)  where
  attr OnError value = unsafeAttribute (  
    { key: "error", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnError (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnError eventValue = unsafeAttribute (map (map (
    \value -> { key: "error", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnError (Event.Event  (Effect Unit) ) where
  attr OnError eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnError  (Effect Boolean)  where
  attr OnError value = unsafeAttribute (  
    { key: "error", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnError (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnError eventValue = unsafeAttribute (map (map (
    \value -> { key: "error", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnError (Event.Event  (Effect Boolean) ) where
  attr OnError eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "error", value: cb' (Cb (const value)) } 
instance Attr everything OnError  Unit  where
  attr OnError _ = unsafeAttribute (  { key: "error", value: unset'  } <$ _)
instance Attr everything OnError (Event.Event Unit -> Event.Event  Unit ) where
  attr OnError eventValue = unsafeAttribute (map (map ( \_ ->
    { key: "error", value: unset' })) eventValue)
instance Attr everything OnError (Event.Event  Unit ) where
  attr OnError eventValue = unsafeAttribute \_ -> eventValue <#> \_ ->
    { key: "error", value: unset' }