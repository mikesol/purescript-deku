module Deku.DOM.Attr.OnPlay where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPlay = OnPlay

instance Attr anything OnPlay  Cb  where
  attr OnPlay value = unsafeAttribute $ Left $  
    { key: "play", value: cb' value }
instance Attr anything OnPlay (Event.Event  Cb ) where
  attr OnPlay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "play", value: cb' value }


instance Attr anything OnPlay  (Effect Unit)  where
  attr OnPlay value = unsafeAttribute $ Left $  
    { key: "play", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPlay (Event.Event  (Effect Unit) ) where
  attr OnPlay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "play", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPlay  (Effect Boolean)  where
  attr OnPlay value = unsafeAttribute $ Left $  
    { key: "play", value: cb' (Cb (const value)) }
instance Attr anything OnPlay (Event.Event  (Effect Boolean) ) where
  attr OnPlay eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "play", value: cb' (Cb (const value)) }


instance Attr everything OnPlay  Unit  where
  attr OnPlay _ = unsafeAttribute $ Left $  { key: "play", value: unset' }
instance Attr everything OnPlay (Event.Event  Unit ) where
  attr OnPlay eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "play", value: unset' }
