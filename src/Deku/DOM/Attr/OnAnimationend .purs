module Deku.DOM.Attr.OnAnimationend  where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnAnimationend  = OnAnimationend 
instance Attr anything OnAnimationend  Cb where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb' value }
instance Attr anything OnAnimationend  (Effect Unit) where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnAnimationend  (Effect Boolean) where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb' (Cb (const value)) }
instance Attr anything OnAnimationend  (Zora Unit) where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnAnimationend  (Zora Boolean) where
  attr OnAnimationend  value = unsafeAttribute { key: "animationend ", value: cb' (Cb (const (runImpure value))) }