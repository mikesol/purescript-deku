module Deku.DOM.Attr.OnDurationchange where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDurationchange = OnDurationchange

instance Attr anything OnDurationchange  Cb  where
  attr OnDurationchange value = unsafeAttribute (  
    { key: "durationchange", value: cb' value  } <$ _)
instance Attr anything OnDurationchange (Event.Event  Cb ) where
  attr OnDurationchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "durationchange", value: cb' value }


instance Attr anything OnDurationchange  (Effect Unit)  where
  attr OnDurationchange value = unsafeAttribute (  
    { key: "durationchange", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnDurationchange (Event.Event  (Effect Unit) ) where
  attr OnDurationchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \value ->
      { key: "durationchange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDurationchange  (Effect Boolean)  where
  attr OnDurationchange value = unsafeAttribute (  
    { key: "durationchange", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnDurationchange (Event.Event  (Effect Boolean) ) where
  attr OnDurationchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \value -> { key: "durationchange", value: cb' (Cb (const value)) } 


instance Attr everything OnDurationchange  Unit  where
  attr OnDurationchange _ = unsafeAttribute (  
    { key: "durationchange", value: unset'  } <$ _)
instance Attr everything OnDurationchange (Event.Event  Unit ) where
  attr OnDurationchange eventValue = unsafeAttribute \_ -> eventValue
    <#> \_ -> { key: "durationchange", value: unset' }
