module Deku.DOM.Attr.OnTouchcancel   where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTouchcancel   = OnTouchcancel  
instance Attr anything OnTouchcancel   Cb where
  attr OnTouchcancel   value = unsafeAttribute { key: "touchcancel  ", value: cb' value }