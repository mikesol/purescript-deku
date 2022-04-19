module Deku.DOM.Attr.OnPointerover where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerover = OnPointerover
instance Attr anything OnPointerover Cb where
  attr OnPointerover value = unsafeAttribute { key: "pointerover", value: cb' value }