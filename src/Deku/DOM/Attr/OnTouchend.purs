module Deku.DOM.Attr.OnTouchend where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnTouchend = OnTouchend

instance Attr anything OnTouchend  Cb  where
  attr OnTouchend value = unsafeAttribute $ Left $  
    { key: "touchend", value: cb' value }
instance Attr anything OnTouchend (Event.Event  Cb ) where
  attr OnTouchend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchend", value: cb' value }


instance Attr anything OnTouchend  (Effect Unit)  where
  attr OnTouchend value = unsafeAttribute $ Left $  
    { key: "touchend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnTouchend (Event.Event  (Effect Unit) ) where
  attr OnTouchend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnTouchend  (Effect Boolean)  where
  attr OnTouchend value = unsafeAttribute $ Left $  
    { key: "touchend", value: cb' (Cb (const value)) }
instance Attr anything OnTouchend (Event.Event  (Effect Boolean) ) where
  attr OnTouchend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "touchend", value: cb' (Cb (const value)) }


instance Attr everything OnTouchend  Unit  where
  attr OnTouchend _ = unsafeAttribute $ Left $  
    { key: "touchend", value: unset' }
instance Attr everything OnTouchend (Event.Event  Unit ) where
  attr OnTouchend eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "touchend", value: unset' }
