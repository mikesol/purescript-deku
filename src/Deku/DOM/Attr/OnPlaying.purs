module Deku.DOM.Attr.OnPlaying where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPlaying = OnPlaying
instance Attr anything OnPlaying Cb where
  attr OnPlaying value = unsafeAttribute { key: "playing", value: cb' value }