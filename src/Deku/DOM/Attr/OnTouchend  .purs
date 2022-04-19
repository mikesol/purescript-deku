module Deku.DOM.Attr.OnTouchend   where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTouchend   = OnTouchend  
instance Attr anything OnTouchend   Cb where
  attr OnTouchend   value = unsafeAttribute { key: "touchend  ", value: cb' value }