module Deku.DOM.Attr.OnPointerup where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerup = OnPointerup
instance Attr anything OnPointerup Cb where
  attr OnPointerup value = unsafeAttribute { key: "pointerup", value: cb' value }