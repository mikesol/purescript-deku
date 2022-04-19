module Deku.DOM.Attr.OnResize where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnResize = OnResize
instance Attr anything OnResize Cb where
  attr OnResize value = unsafeAttribute { key: "resize", value: cb' value }