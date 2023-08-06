module Deku.DOM.Attr.OnPointercancel where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPointercancel = OnPointercancel

instance Attr anything OnPointercancel  Cb  where
  attr OnPointercancel value = unsafeAttribute $ Left $  
    { key: "pointercancel", value: cb' value }
instance Attr anything OnPointercancel (Event.Event  Cb ) where
  attr OnPointercancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' value }


instance Attr anything OnPointercancel  (Effect Unit)  where
  attr OnPointercancel value = unsafeAttribute $ Left $  
    { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointercancel (Event.Event  (Effect Unit) ) where
  attr OnPointercancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "pointercancel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPointercancel  (Effect Boolean)  where
  attr OnPointercancel value = unsafeAttribute $ Left $  
    { key: "pointercancel", value: cb' (Cb (const value)) }
instance Attr anything OnPointercancel (Event.Event  (Effect Boolean) ) where
  attr OnPointercancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "pointercancel", value: cb' (Cb (const value)) }


instance Attr everything OnPointercancel  Unit  where
  attr OnPointercancel _ = unsafeAttribute $ Left $  
    { key: "pointercancel", value: unset' }
instance Attr everything OnPointercancel (Event.Event  Unit ) where
  attr OnPointercancel eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "pointercancel", value: unset' }
