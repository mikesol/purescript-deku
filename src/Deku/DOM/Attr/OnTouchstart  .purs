module Deku.DOM.Attr.OnTouchstart   where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTouchstart   = OnTouchstart  
instance Attr anything OnTouchstart   Cb where
  attr OnTouchstart   value = unsafeAttribute { key: "touchstart  ", value: cb' value }