module Deku.DOM.Attr.OnMouseleave where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMouseleave = OnMouseleave
instance Attr anything OnMouseleave Cb where
  attr OnMouseleave value = unsafeAttribute { key: "mouseleave", value: cb' value }