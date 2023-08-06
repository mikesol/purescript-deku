module Deku.DOM.Attr.OnInvalid where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnInvalid = OnInvalid

instance Attr anything OnInvalid  Cb  where
  attr OnInvalid value = unsafeAttribute $ Left $  
    { key: "invalid", value: cb' value }
instance Attr anything OnInvalid (Event.Event  Cb ) where
  attr OnInvalid eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "invalid", value: cb' value }


instance Attr anything OnInvalid  (Effect Unit)  where
  attr OnInvalid value = unsafeAttribute $ Left $  
    { key: "invalid", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnInvalid (Event.Event  (Effect Unit) ) where
  attr OnInvalid eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnInvalid  (Effect Boolean)  where
  attr OnInvalid value = unsafeAttribute $ Left $  
    { key: "invalid", value: cb' (Cb (const value)) }
instance Attr anything OnInvalid (Event.Event  (Effect Boolean) ) where
  attr OnInvalid eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "invalid", value: cb' (Cb (const value)) }


instance Attr everything OnInvalid  Unit  where
  attr OnInvalid _ = unsafeAttribute $ Left $  
    { key: "invalid", value: unset' }
instance Attr everything OnInvalid (Event.Event  Unit ) where
  attr OnInvalid eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "invalid", value: unset' }
