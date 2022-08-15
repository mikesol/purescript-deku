module Deku.DOM.Attr.OnAnimationiteration  where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnAnimationiteration  = OnAnimationiteration 
instance Attr anything OnAnimationiteration  Cb where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' value }
instance Attr anything OnAnimationiteration  (Effect Unit) where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationiteration  (Effect Boolean) where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationiteration  (Zora Unit) where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnAnimationiteration  (Zora Boolean) where
  attr OnAnimationiteration  value = unsafeAttribute { key: "animationiteration ", value: cb' (Cb (const (runImpure value))) }