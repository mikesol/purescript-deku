module Deku.DOM.Attr.OnPointerout where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerout = OnPointerout
instance Attr anything OnPointerout Cb where
  attr OnPointerout value = unsafeAttribute { key: "pointerout", value: cb' value }