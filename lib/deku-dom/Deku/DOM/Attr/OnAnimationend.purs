module Deku.DOM.Attr.OnAnimationend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationend = OnAnimationend

instance Attr anything OnAnimationend Cb where
  attr OnAnimationend value = unsafeAttribute
    { key: "animationend ", value: cb' value }

instance Attr anything OnAnimationend (Effect Unit) where
  attr OnAnimationend value = unsafeAttribute
    { key: "animationend ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationend (Effect Boolean) where
  attr OnAnimationend value = unsafeAttribute
    { key: "animationend ", value: cb' (Cb (const value)) }

type OnAnimationendEffect =
  forall element
   . Attr element OnAnimationend (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationend Unit where
  attr OnAnimationend _ = unsafeAttribute
    { key: "animationend ", value: unset' }
