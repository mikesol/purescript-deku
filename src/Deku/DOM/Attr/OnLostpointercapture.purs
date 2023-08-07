module Deku.DOM.Attr.OnLostpointercapture where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnLostpointercapture = OnLostpointercapture

instance Attr anything OnLostpointercapture  Cb  where
  attr OnLostpointercapture value = unsafeAttribute (  
    { key: "lostpointercapture", value: cb' value  } <$ _)
instance Attr anything OnLostpointercapture (Event.Event  Cb ) where
  attr OnLostpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \value -> { key: "lostpointercapture", value: cb' value }


instance Attr anything OnLostpointercapture  (Effect Unit)  where
  attr OnLostpointercapture value = unsafeAttribute (  
    { key: "lostpointercapture", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnLostpointercapture (Event.Event  (Effect Unit) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnLostpointercapture  (Effect Boolean)  where
  attr OnLostpointercapture value = unsafeAttribute (  
    { key: "lostpointercapture", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnLostpointercapture (Event.Event  (Effect Boolean) ) where
  attr OnLostpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \value ->
      { key: "lostpointercapture", value: cb' (Cb (const value)) } 


instance Attr everything OnLostpointercapture  Unit  where
  attr OnLostpointercapture _ = unsafeAttribute (  
    { key: "lostpointercapture", value: unset'  } <$ _)
instance Attr everything OnLostpointercapture (Event.Event  Unit ) where
  attr OnLostpointercapture eventValue = unsafeAttribute \_ ->
    eventValue <#> \_ -> { key: "lostpointercapture", value: unset' }
