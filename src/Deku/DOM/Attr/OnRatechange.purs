module Deku.DOM.Attr.OnRatechange where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnRatechange = OnRatechange

instance Attr anything OnRatechange  Cb  where
  attr OnRatechange value = unsafeAttribute (  
    { key: "ratechange", value: cb' value  } <$ _)
instance Attr anything OnRatechange (Event.Event  Cb ) where
  attr OnRatechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "ratechange", value: cb' value }


instance Attr anything OnRatechange  (Effect Unit)  where
  attr OnRatechange value = unsafeAttribute (  
    { key: "ratechange", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnRatechange (Event.Event  (Effect Unit) ) where
  attr OnRatechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnRatechange  (Effect Boolean)  where
  attr OnRatechange value = unsafeAttribute (  
    { key: "ratechange", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnRatechange (Event.Event  (Effect Boolean) ) where
  attr OnRatechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const value)) } 


instance Attr everything OnRatechange  Unit  where
  attr OnRatechange _ = unsafeAttribute (  
    { key: "ratechange", value: unset'  } <$ _)
instance Attr everything OnRatechange (Event.Event  Unit ) where
  attr OnRatechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "ratechange", value: unset' }
