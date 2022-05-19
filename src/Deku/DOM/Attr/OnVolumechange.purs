module Deku.DOM.Attr.OnVolumechange where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnVolumechange = OnVolumechange
instance Attr anything OnVolumechange Cb where
  attr OnVolumechange value = unsafeAttribute { key: "volumechange", value: cb' value }
instance Attr anything OnVolumechange (Effect Unit) where
  attr OnVolumechange value = unsafeAttribute { key: "volumechange", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnVolumechange (Effect Boolean) where
  attr OnVolumechange value = unsafeAttribute { key: "volumechange", value: cb' (Cb (const value)) }