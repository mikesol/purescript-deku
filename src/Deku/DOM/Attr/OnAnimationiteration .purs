module Deku.DOM.Attr.OnAnimationiteration  where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnAnimationiteration  = OnAnimationiteration 
instance Attr anything OnAnimationiteration  Cb where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' value }
instance Attr anything OnAnimationiteration  (Effect Unit) where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationiteration  (Effect Boolean) where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' (Cb (const value)) }