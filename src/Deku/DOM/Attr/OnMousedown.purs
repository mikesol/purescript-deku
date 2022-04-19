module Deku.DOM.Attr.OnMousedown where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMousedown = OnMousedown
instance Attr anything OnMousedown Cb where
  attr OnMousedown value = unsafeAttribute { key: "mousedown", value: cb' value }