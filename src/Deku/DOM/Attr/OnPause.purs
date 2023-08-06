module Deku.DOM.Attr.OnPause where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnPause = OnPause

instance Attr anything OnPause  Cb  where
  attr OnPause value = unsafeAttribute $ Left $  
    { key: "pause", value: cb' value }
instance Attr anything OnPause (Event.Event  Cb ) where
  attr OnPause eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pause", value: cb' value }


instance Attr anything OnPause  (Effect Unit)  where
  attr OnPause value = unsafeAttribute $ Left $  
    { key: "pause", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPause (Event.Event  (Effect Unit) ) where
  attr OnPause eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnPause  (Effect Boolean)  where
  attr OnPause value = unsafeAttribute $ Left $  
    { key: "pause", value: cb' (Cb (const value)) }
instance Attr anything OnPause (Event.Event  (Effect Boolean) ) where
  attr OnPause eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "pause", value: cb' (Cb (const value)) }


instance Attr everything OnPause  Unit  where
  attr OnPause _ = unsafeAttribute $ Left $  { key: "pause", value: unset' }
instance Attr everything OnPause (Event.Event  Unit ) where
  attr OnPause eventValue = unsafeAttribute $ Right $ eventValue <#> \_ ->
    { key: "pause", value: unset' }
