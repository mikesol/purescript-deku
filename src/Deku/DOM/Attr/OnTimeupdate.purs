module Deku.DOM.Attr.OnTimeupdate where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnTimeupdate = OnTimeupdate

instance Attr anything OnTimeupdate  Cb  where
  attr OnTimeupdate value = unsafeAttribute $ Left $  
    { key: "timeupdate", value: cb' value }
instance Attr anything OnTimeupdate (Event.Event  Cb ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' value }


instance Attr anything OnTimeupdate  (Effect Unit)  where
  attr OnTimeupdate value = unsafeAttribute $ Left $  
    { key: "timeupdate", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTimeupdate (Event.Event  (Effect Unit) ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTimeupdate  (Effect Boolean)  where
  attr OnTimeupdate value = unsafeAttribute $ Left $  
    { key: "timeupdate", value: cb' (Cb (const value)) }
instance Attr anything OnTimeupdate (Event.Event  (Effect Boolean) ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "timeupdate", value: cb' (Cb (const value)) }


instance Attr everything OnTimeupdate  Unit  where
  attr OnTimeupdate _ = unsafeAttribute $ Left $  
    { key: "timeupdate", value: unset' }
instance Attr everything OnTimeupdate (Event.Event  Unit ) where
  attr OnTimeupdate eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "timeupdate", value: unset' }
