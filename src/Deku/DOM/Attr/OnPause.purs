module Deku.DOM.Attr.OnPause where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)


data OnPause = OnPause
instance Attr anything OnPause Cb where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb' value }
instance Attr anything OnPause (Effect Unit) where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPause (Effect Boolean) where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb' (Cb (const value)) }