module Deku.DOM.Attr.OnVolumechange where


import Prelude
import Data.Either (Either(..))
import FRP.Event as Event
import Data.NonEmpty as NonEmpty
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange  Cb  where
  attr OnVolumechange value = unsafeAttribute $ Left $  
    { key: "volumechange", value: cb' value }
instance Attr anything OnVolumechange (Event.Event  Cb ) where
  attr OnVolumechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "volumechange", value: cb' value }


instance Attr anything OnVolumechange  (Effect Unit)  where
  attr OnVolumechange value = unsafeAttribute $ Left $  
    { key: "volumechange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnVolumechange (Event.Event  (Effect Unit) ) where
  attr OnVolumechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnVolumechange  (Effect Boolean)  where
  attr OnVolumechange value = unsafeAttribute $ Left $  
    { key: "volumechange", value: cb' (Cb (const value)) }
instance Attr anything OnVolumechange (Event.Event  (Effect Boolean) ) where
  attr OnVolumechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const value)) }


instance Attr everything OnVolumechange  Unit  where
  attr OnVolumechange _ = unsafeAttribute $ Left $  
    { key: "volumechange", value: unset' }
instance Attr everything OnVolumechange (Event.Event  Unit ) where
  attr OnVolumechange eventValue = unsafeAttribute $ Right $ eventValue <#>
    \_ -> { key: "volumechange", value: unset' }
