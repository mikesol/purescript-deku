module Deku.DOM.Attr.OnTouchmove   where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTouchmove   = OnTouchmove  
instance Attr anything OnTouchmove   Cb where
  attr OnTouchmove   value = unsafeAttribute { key: "touchmove  ", value: cb' value }