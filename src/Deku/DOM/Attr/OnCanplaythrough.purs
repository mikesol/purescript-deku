module Deku.DOM.Attr.OnCanplaythrough where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnCanplaythrough = OnCanplaythrough

instance Attr anything OnCanplaythrough  Cb  where
  attr OnCanplaythrough value = unsafeAttribute $ Left $  
    { key: "canplaythrough", value: cb' value }
instance Attr anything OnCanplaythrough (Event.Event  Cb ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "canplaythrough", value: cb' value }


instance Attr anything OnCanplaythrough  (Effect Unit)  where
  attr OnCanplaythrough value = unsafeAttribute $ Left $  
    { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnCanplaythrough (Event.Event  (Effect Unit) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value ->
      { key: "canplaythrough", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnCanplaythrough  (Effect Boolean)  where
  attr OnCanplaythrough value = unsafeAttribute $ Left $  
    { key: "canplaythrough", value: cb' (Cb (const value)) }
instance Attr anything OnCanplaythrough (Event.Event  (Effect Boolean) ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ Right $ eventValue
    <#> \value -> { key: "canplaythrough", value: cb' (Cb (const value)) }


instance Attr everything OnCanplaythrough  Unit  where
  attr OnCanplaythrough _ = unsafeAttribute $ Left $  
    { key: "canplaythrough", value: unset' }
instance Attr everything OnCanplaythrough (Event.Event  Unit ) where
  attr OnCanplaythrough eventValue = unsafeAttribute $ Right $ eventValue
    <#> \_ -> { key: "canplaythrough", value: unset' }
