module Deku.DOM.Attr.OnMousemove where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMousemove = OnMousemove
instance Attr anything OnMousemove Cb where
  attr OnMousemove value = unsafeAttribute { key: "mousemove", value: cb' value }