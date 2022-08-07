module Deku.DOM.Attr.OnPointerenter where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter Cb where
  attr OnPointerenter value = unsafeAttribute
    { key: "pointerenter", value: cb' value }

instance Attr anything OnPointerenter (Effect Unit) where
  attr OnPointerenter value = unsafeAttribute
    { key: "pointerenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerenter (Effect Boolean) where
  attr OnPointerenter value = unsafeAttribute
    { key: "pointerenter", value: cb' (Cb (const value)) }