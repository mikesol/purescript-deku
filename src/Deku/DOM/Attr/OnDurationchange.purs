module Deku.DOM.Attr.OnDurationchange where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDurationchange = OnDurationchange

instance Attr anything OnDurationchange  Cb  where
  attr OnDurationchange value = unsafeAttribute $ Left $  
    { key: "durationchange", value: cb' value }
instance Attr anything OnDurationchange (Event.Event  Cb ) where
  attr OnDurationchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "durationchange", value: cb' value }


instance Attr anything OnDurationchange  (Effect Unit)  where
  attr OnDurationchange value = unsafeAttribute $ Left $  
    { key: "durationchange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDurationchange (Event.Event  (Effect Unit) ) where
  attr OnDurationchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "durationchange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDurationchange  (Effect Boolean)  where
  attr OnDurationchange value = unsafeAttribute $ Left $  
    { key: "durationchange", value: cb' (Cb (const value)) }
instance Attr anything OnDurationchange (Event.Event  (Effect Boolean) ) where
  attr OnDurationchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "durationchange", value: cb' (Cb (const value)) }


instance Attr everything OnDurationchange  Unit  where
  attr OnDurationchange _ = unsafeAttribute $ Left $  
    { key: "durationchange", value: unset' }
instance Attr everything OnDurationchange (Event.Event  Unit ) where
  attr OnDurationchange eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "durationchange", value: unset' }
