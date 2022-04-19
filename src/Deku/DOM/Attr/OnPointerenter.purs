module Deku.DOM.Attr.OnPointerenter where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerenter = OnPointerenter
instance Attr anything OnPointerenter Cb where
  attr OnPointerenter value = unsafeAttribute { key: "pointerenter", value: cb' value }