module Deku.DOM.Attr.OnPlaying where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnPlaying = OnPlaying

instance Attr anything OnPlaying Cb where
  attr OnPlaying value = unsafeAttribute { key: "playing", value: cb' value }

instance Attr anything OnPlaying (Effect Unit) where
  attr OnPlaying value = unsafeAttribute
    { key: "playing", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlaying (Effect Boolean) where
  attr OnPlaying value = unsafeAttribute
    { key: "playing", value: cb' (Cb (const value)) }