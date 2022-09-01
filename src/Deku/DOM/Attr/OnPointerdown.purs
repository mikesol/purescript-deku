module Deku.DOM.Attr.OnPointerdown where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)


data OnPointerdown = OnPointerdown
instance Attr anything OnPointerdown Cb where
  attr OnPointerdown value = unsafeAttribute { key: "pointerdown", value: cb' value }
instance Attr anything OnPointerdown (Effect Unit) where
  attr OnPointerdown value = unsafeAttribute { key: "pointerdown", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerdown (Effect Boolean) where
  attr OnPointerdown value = unsafeAttribute { key: "pointerdown", value: cb' (Cb (const value)) }