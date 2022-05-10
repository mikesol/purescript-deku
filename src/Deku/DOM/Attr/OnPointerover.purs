module Deku.DOM.Attr.OnPointerover where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnPointerover = OnPointerover

instance Attr anything OnPointerover Cb where
  attr OnPointerover value = unsafeAttribute
    { key: "pointerover", value: cb' value }

instance Attr anything OnPointerover (Effect Unit) where
  attr OnPointerover value = unsafeAttribute
    { key: "pointerover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerover (Effect Boolean) where
  attr OnPointerover value = unsafeAttribute
    { key: "pointerover", value: cb' (Cb (const value)) }