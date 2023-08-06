module Deku.DOM.Attr.OnWaiting where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnWaiting = OnWaiting

instance Attr anything OnWaiting  Cb  where
  attr OnWaiting value = unsafeAttribute $ Left $  
    { key: "waiting", value: cb' value }
instance Attr anything OnWaiting (Event.Event  Cb ) where
  attr OnWaiting eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "waiting", value: cb' value }


instance Attr anything OnWaiting  (Effect Unit)  where
  attr OnWaiting value = unsafeAttribute $ Left $  
    { key: "waiting", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWaiting (Event.Event  (Effect Unit) ) where
  attr OnWaiting eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnWaiting  (Effect Boolean)  where
  attr OnWaiting value = unsafeAttribute $ Left $  
    { key: "waiting", value: cb' (Cb (const value)) }
instance Attr anything OnWaiting (Event.Event  (Effect Boolean) ) where
  attr OnWaiting eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "waiting", value: cb' (Cb (const value)) }


instance Attr everything OnWaiting  Unit  where
  attr OnWaiting _ = unsafeAttribute $ Left $  
    { key: "waiting", value: unset' }
instance Attr everything OnWaiting (Event.Event  Unit ) where
  attr OnWaiting eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "waiting", value: unset' }
