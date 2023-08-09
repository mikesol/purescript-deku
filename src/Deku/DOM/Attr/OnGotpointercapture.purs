module Deku.DOM.Attr.OnGotpointercapture where
import Prelude
import FRP.Event as Event
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')
data OnGotpointercapture = OnGotpointercapture
instance Attr anything OnGotpointercapture  Cb  where
  attr OnGotpointercapture value = unsafeAttribute (  
    { key: "gotpointercapture", value: cb' value  } <$ _)
instance Attr anything OnGotpointercapture (Event.Event Unit -> Event.Event  Cb ) where
  attr OnGotpointercapture eventValue = unsafeAttribute (map (map ( \value -> { key: "gotpointercapture", value: cb' value })) eventValue)
instance Attr anything OnGotpointercapture (Event.Event  Cb ) where
  attr OnGotpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \value -> { key: "gotpointercapture", value: cb' value }
instance Attr anything OnGotpointercapture  (Effect Unit)  where
  attr OnGotpointercapture value = unsafeAttribute (  
    { key: "gotpointercapture", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnGotpointercapture (Event.Event Unit -> Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute (map (map ( \value ->
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) })) eventValue)
instance Attr anything OnGotpointercapture (Event.Event  (Effect Unit) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnGotpointercapture  (Effect Boolean)  where
  attr OnGotpointercapture value = unsafeAttribute (  
    { key: "gotpointercapture", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnGotpointercapture (Event.Event Unit -> Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute (map (map ( \value ->
      { key: "gotpointercapture", value: cb' (Cb (const value)) })) eventValue) 
instance Attr anything OnGotpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnGotpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "gotpointercapture", value: cb' (Cb (const value)) } 
instance Attr everything OnGotpointercapture  Unit  where
  attr OnGotpointercapture _ = unsafeAttribute (  
    { key: "gotpointercapture", value: unset'  } <$ _)
instance Attr everything OnGotpointercapture (Event.Event Unit -> Event.Event  Unit ) where
  attr OnGotpointercapture eventValue = unsafeAttribute (map (map ( \_ -> { key: "gotpointercapture", value: unset' })) eventValue)
instance Attr everything OnGotpointercapture (Event.Event  Unit ) where
  attr OnGotpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "gotpointercapture", value: unset' }