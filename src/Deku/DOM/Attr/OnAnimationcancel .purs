module Deku.DOM.Attr.OnAnimationcancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnAnimationcancel = OnAnimationcancel

instance Attr anything OnAnimationcancel Cb where
  attr OnAnimationcancel value = unsafeAttribute
    { key: "animationcancel ", value: cb' value }

instance Attr anything OnAnimationcancel (Effect Unit) where
  attr OnAnimationcancel value = unsafeAttribute
    { key: "animationcancel ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationcancel (Effect Boolean) where
  attr OnAnimationcancel value = unsafeAttribute
    { key: "animationcancel ", value: cb' (Cb (const value)) }

instance Attr anything OnAnimationcancel (Zora Unit) where
  attr OnAnimationcancel value = unsafeAttribute
    { key: "animationcancel "
    , value: cb' (Cb (const (runImpure (value $> true))))
    }

instance Attr anything OnAnimationcancel (Zora Boolean) where
  attr OnAnimationcancel value = unsafeAttribute
    { key: "animationcancel ", value: cb' (Cb (const (runImpure value))) }