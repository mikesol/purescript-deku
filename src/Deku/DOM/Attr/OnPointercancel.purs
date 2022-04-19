module Deku.DOM.Attr.OnPointercancel where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointercancel = OnPointercancel
instance Attr anything OnPointercancel Cb where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb' value }