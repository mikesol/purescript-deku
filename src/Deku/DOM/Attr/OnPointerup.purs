module Deku.DOM.Attr.OnPointerup where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnPointerup = OnPointerup
instance Attr anything OnPointerup Cb where
  attr OnPointerup value = unsafeAttribute { key: "pointerup", value: cb' value }
instance Attr anything OnPointerup (Effect Unit) where
  attr OnPointerup value = unsafeAttribute { key: "pointerup", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerup (Effect Boolean) where
  attr OnPointerup value = unsafeAttribute { key: "pointerup", value: cb' (Cb (const value)) }