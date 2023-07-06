module Deku.DOM.Attr.OnAnimationiteration where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationiteration = OnAnimationiteration

instance Attr anything OnAnimationiteration Cb where
  attr OnAnimationiteration value = unsafeAttribute
    { key: "animationiteration ", value: cb' value }

instance Attr anything OnAnimationiteration (Effect Unit) where
  attr OnAnimationiteration value = unsafeAttribute
    { key: "animationiteration ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationiteration (Effect Boolean) where
  attr OnAnimationiteration value = unsafeAttribute
    { key: "animationiteration ", value: cb' (Cb (const value)) }

type OnAnimationiterationEffect =
  forall element
   . Attr element OnAnimationiteration (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationiteration Unit where
  attr OnAnimationiteration _ = unsafeAttribute
    { key: "animationiteration ", value: unset' }
