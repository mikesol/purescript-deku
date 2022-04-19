module Deku.DOM.Attr.OnScroll where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnScroll = OnScroll
instance Attr anything OnScroll Cb where
  attr OnScroll value = unsafeAttribute { key: "scroll", value: cb' value }