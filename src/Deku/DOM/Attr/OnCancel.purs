module Deku.DOM.Attr.OnCancel where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnCancel = OnCancel

instance Attr anything OnCancel  Cb  where
  attr OnCancel value = unsafeAttribute $ Left $  
    { key: "cancel", value: cb' value }
instance Attr anything OnCancel (Event.Event  Cb ) where
  attr OnCancel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "cancel", value: cb' value }


instance Attr anything OnCancel  (Effect Unit)  where
  attr OnCancel value = unsafeAttribute $ Left $  
    { key: "cancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCancel (Event.Event  (Effect Unit) ) where
  attr OnCancel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnCancel  (Effect Boolean)  where
  attr OnCancel value = unsafeAttribute $ Left $  
    { key: "cancel", value: cb' (Cb (const value)) }
instance Attr anything OnCancel (Event.Event  (Effect Boolean) ) where
  attr OnCancel eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "cancel", value: cb' (Cb (const value)) }


instance Attr everything OnCancel  Unit  where
  attr OnCancel _ = unsafeAttribute $ Left $  { key: "cancel", value: unset' }
instance Attr everything OnCancel (Event.Event  Unit ) where
  attr OnCancel eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "cancel", value: unset' }
