module Deku.DOM.Attr.OnVolumechange where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnVolumechange = OnVolumechange
instance Attr anything OnVolumechange Cb where
  attr OnVolumechange value = unsafeAttribute { key: "volumechange", value: cb' value }