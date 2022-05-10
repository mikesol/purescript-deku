module Deku.DOM.Attr.OnPointerout where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnPointerout = OnPointerout

instance Attr anything OnPointerout Cb where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' value }

instance Attr anything OnPointerout (Effect Unit) where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerout (Effect Boolean) where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' (Cb (const value)) }