module Deku.DOM.Attr.OnPointerdown where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerdown = OnPointerdown
instance Attr anything OnPointerdown Cb where
  attr OnPointerdown value = unsafeAttribute { key: "pointerdown", value: cb' value }