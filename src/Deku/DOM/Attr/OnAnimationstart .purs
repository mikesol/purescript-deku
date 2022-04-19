module Deku.DOM.Attr.OnAnimationstart  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnAnimationstart  = OnAnimationstart 
instance Attr anything OnAnimationstart  Cb where
  attr OnAnimationstart  value = unsafeAttribute { key: "animationstart ", value: cb' value }