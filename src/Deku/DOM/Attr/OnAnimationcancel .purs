module Deku.DOM.Attr.OnAnimationcancel  where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnAnimationcancel  = OnAnimationcancel 
instance Attr anything OnAnimationcancel  Cb where
  attr OnAnimationcancel  value = unsafeAttribute { key: "animationcancel ", value: cb' value }
instance Attr anything OnAnimationcancel  (Effect Unit) where
  attr OnAnimationcancel  value = unsafeAttribute { key: "animationcancel ", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationcancel  (Effect Boolean) where
  attr OnAnimationcancel  value = unsafeAttribute { key: "animationcancel ", value: cb' (Cb (const value)) }