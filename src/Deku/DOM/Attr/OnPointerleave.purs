module Deku.DOM.Attr.OnPointerleave where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerleave = OnPointerleave

instance Attr anything OnPointerleave  Cb  where
  attr OnPointerleave value = unsafeAttribute $ Left $  
    { key: "pointerleave", value: cb' value }
instance Attr anything OnPointerleave (Event.Event  Cb ) where
  attr OnPointerleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' value }


instance Attr anything OnPointerleave  (Effect Unit)  where
  attr OnPointerleave value = unsafeAttribute $ Left $  
    { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerleave (Event.Event  (Effect Unit) ) where
  attr OnPointerleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerleave  (Effect Boolean)  where
  attr OnPointerleave value = unsafeAttribute $ Left $  
    { key: "pointerleave", value: cb' (Cb (const value)) }
instance Attr anything OnPointerleave (Event.Event  (Effect Boolean) ) where
  attr OnPointerleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerleave", value: cb' (Cb (const value)) }


instance Attr everything OnPointerleave  Unit  where
  attr OnPointerleave _ = unsafeAttribute $ Left $  
    { key: "pointerleave", value: unset' }
instance Attr everything OnPointerleave (Event.Event  Unit ) where
  attr OnPointerleave eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointerleave", value: unset' }
