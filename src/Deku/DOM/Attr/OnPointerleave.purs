module Deku.DOM.Attr.OnPointerleave where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerleave = OnPointerleave
instance Attr anything OnPointerleave Cb where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb' value }