module Deku.DOM.Attr.OnAnimationcancel  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnAnimationcancel  = OnAnimationcancel 
instance Attr anything OnAnimationcancel  Cb where
  attr OnAnimationcancel  value = unsafeAttribute { key: "animationcancel ", value: cb' value }