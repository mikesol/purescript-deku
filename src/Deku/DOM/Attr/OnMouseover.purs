module Deku.DOM.Attr.OnMouseover where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMouseover = OnMouseover
instance Attr anything OnMouseover Cb where
  attr OnMouseover value = unsafeAttribute { key: "mouseover", value: cb' value }