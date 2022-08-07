module Deku.DOM.Attr.OnPlay where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnPlay = OnPlay
instance Attr anything OnPlay Cb where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb' value }
instance Attr anything OnPlay (Effect Unit) where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPlay (Effect Boolean) where
  attr OnPlay value = unsafeAttribute { key: "play", value: cb' (Cb (const value)) }