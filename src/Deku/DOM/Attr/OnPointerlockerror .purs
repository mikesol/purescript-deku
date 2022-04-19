module Deku.DOM.Attr.OnPointerlockerror  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerlockerror  = OnPointerlockerror 
instance Attr anything OnPointerlockerror  Cb where
  attr OnPointerlockerror  value = unsafeAttribute { key: "pointerlockerror ", value: cb' value }