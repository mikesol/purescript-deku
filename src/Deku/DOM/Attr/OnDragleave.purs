module Deku.DOM.Attr.OnDragleave where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnDragleave = OnDragleave

instance Attr anything OnDragleave  Cb  where
  attr OnDragleave value = unsafeAttribute $ Left $  
    { key: "dragleave", value: cb' value }
instance Attr anything OnDragleave (Event.Event  Cb ) where
  attr OnDragleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragleave", value: cb' value }


instance Attr anything OnDragleave  (Effect Unit)  where
  attr OnDragleave value = unsafeAttribute $ Left $  
    { key: "dragleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragleave (Event.Event  (Effect Unit) ) where
  attr OnDragleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnDragleave  (Effect Boolean)  where
  attr OnDragleave value = unsafeAttribute $ Left $  
    { key: "dragleave", value: cb' (Cb (const value)) }
instance Attr anything OnDragleave (Event.Event  (Effect Boolean) ) where
  attr OnDragleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "dragleave", value: cb' (Cb (const value)) }


instance Attr everything OnDragleave  Unit  where
  attr OnDragleave _ = unsafeAttribute $ Left $  
    { key: "dragleave", value: unset' }
instance Attr everything OnDragleave (Event.Event  Unit ) where
  attr OnDragleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "dragleave", value: unset' }
