module Deku.DOM.Attr.OnRatechange where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnRatechange = OnRatechange

instance Attr anything OnRatechange  Cb  where
  attr OnRatechange value = unsafeAttribute $ Left $  
    { key: "ratechange", value: cb' value }
instance Attr anything OnRatechange (Event.Event  Cb ) where
  attr OnRatechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "ratechange", value: cb' value }


instance Attr anything OnRatechange  (Effect Unit)  where
  attr OnRatechange value = unsafeAttribute $ Left $  
    { key: "ratechange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnRatechange (Event.Event  (Effect Unit) ) where
  attr OnRatechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnRatechange  (Effect Boolean)  where
  attr OnRatechange value = unsafeAttribute $ Left $  
    { key: "ratechange", value: cb' (Cb (const value)) }
instance Attr anything OnRatechange (Event.Event  (Effect Boolean) ) where
  attr OnRatechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "ratechange", value: cb' (Cb (const value)) }


instance Attr everything OnRatechange  Unit  where
  attr OnRatechange _ = unsafeAttribute $ Left $  
    { key: "ratechange", value: unset' }
instance Attr everything OnRatechange (Event.Event  Unit ) where
  attr OnRatechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "ratechange", value: unset' }
