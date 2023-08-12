module Deku.DOM.Attr.OnVolumechange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnVolumechange = OnVolumechange

instance Attr anything OnVolumechange Cb where
  attr OnVolumechange value = unsafeAttribute
    { key: "volumechange", value: cb' value }

instance Attr anything OnVolumechange (Effect Unit) where
  attr OnVolumechange value = unsafeAttribute
    { key: "volumechange", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnVolumechange (Effect Boolean) where
  attr OnVolumechange value = unsafeAttribute
    { key: "volumechange", value: cb' (Cb (const value)) }

type OnVolumechangeEffect =
  forall element
   . Attr element OnVolumechange (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnVolumechange Unit where
  attr OnVolumechange _ = unsafeAttribute
    { key: "volumechange", value: unset' }
