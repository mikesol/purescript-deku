module Deku.DOM.Attr.OnMouseup where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMouseup = OnMouseup
instance Attr anything OnMouseup Cb where
  attr OnMouseup value = unsafeAttribute { key: "mouseup", value: cb' value }