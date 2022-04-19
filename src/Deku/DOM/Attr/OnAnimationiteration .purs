module Deku.DOM.Attr.OnAnimationiteration  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnAnimationiteration  = OnAnimationiteration 
instance Attr anything OnAnimationiteration  Cb where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' value }