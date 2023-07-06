module Deku.DOM.Attr.OnPlaying where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPlaying = OnPlaying

instance Attr anything OnPlaying Cb where
  attr OnPlaying value = unsafeAttribute { key: "playing", value: cb' value }

instance Attr anything OnPlaying (Effect Unit) where
  attr OnPlaying value = unsafeAttribute
    { key: "playing", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPlaying (Effect Boolean) where
  attr OnPlaying value = unsafeAttribute
    { key: "playing", value: cb' (Cb (const value)) }

type OnPlayingEffect =
  forall element
   . Attr element OnPlaying (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPlaying Unit where
  attr OnPlaying _ = unsafeAttribute
    { key: "playing", value: unset' }
