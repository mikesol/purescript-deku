module Deku.DOM.Attr.OnAnimationend  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnAnimationend  = OnAnimationend 
instance Attr anything OnAnimationend  Cb where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb' value }