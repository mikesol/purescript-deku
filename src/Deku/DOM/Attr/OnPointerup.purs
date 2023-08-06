module Deku.DOM.Attr.OnPointerup where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointerup = OnPointerup

instance Attr anything OnPointerup  Cb  where
  attr OnPointerup value = unsafeAttribute $ Left $  
    { key: "pointerup", value: cb' value }
instance Attr anything OnPointerup (Event.Event  Cb ) where
  attr OnPointerup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerup", value: cb' value }


instance Attr anything OnPointerup  (Effect Unit)  where
  attr OnPointerup value = unsafeAttribute $ Left $  
    { key: "pointerup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerup (Event.Event  (Effect Unit) ) where
  attr OnPointerup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointerup  (Effect Boolean)  where
  attr OnPointerup value = unsafeAttribute $ Left $  
    { key: "pointerup", value: cb' (Cb (const value)) }
instance Attr anything OnPointerup (Event.Event  (Effect Boolean) ) where
  attr OnPointerup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pointerup", value: cb' (Cb (const value)) }


instance Attr everything OnPointerup  Unit  where
  attr OnPointerup _ = unsafeAttribute $ Left $  
    { key: "pointerup", value: unset' }
instance Attr everything OnPointerup (Event.Event  Unit ) where
  attr OnPointerup eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "pointerup", value: unset' }
