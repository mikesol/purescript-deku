module Deku.DOM.Attr.OnVolumechange where


import Prelude

import FRP.Event as Event

import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute, unset')

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange  Cb  where
  attr OnVolumechange value = unsafeAttribute (  
    { key: "volumechange", value: cb' value  } <$ _)
instance Attr anything OnVolumechange (Event.Event  Cb ) where
  attr OnVolumechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "volumechange", value: cb' value }


instance Attr anything OnVolumechange  (Effect Unit)  where
  attr OnVolumechange value = unsafeAttribute (  
    { key: "volumechange", value: cb' (Cb (const (value $> true)))  } <$ _)
instance Attr anything OnVolumechange (Event.Event  (Effect Unit) ) where
  attr OnVolumechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const (value $> true))) }


instance Attr anything OnVolumechange  (Effect Boolean)  where
  attr OnVolumechange value = unsafeAttribute (  
    { key: "volumechange", value: cb' (Cb (const value))  } <$ _)
instance Attr anything OnVolumechange (Event.Event  (Effect Boolean) ) where
  attr OnVolumechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \value -> { key: "volumechange", value: cb' (Cb (const value)) } 


instance Attr everything OnVolumechange  Unit  where
  attr OnVolumechange _ = unsafeAttribute (  
    { key: "volumechange", value: unset'  } <$ _)
instance Attr everything OnVolumechange (Event.Event  Unit ) where
  attr OnVolumechange eventValue = unsafeAttribute \_ -> eventValue <#>
    \_ -> { key: "volumechange", value: unset' }
