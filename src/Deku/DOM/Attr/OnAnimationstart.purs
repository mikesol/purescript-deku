module Deku.DOM.Attr.OnAnimationstart where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnAnimationstart = OnAnimationstart

instance Attr anything OnAnimationstart Cb where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' value }

instance Attr anything OnAnimationstart (Effect Unit) where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAnimationstart (Effect Boolean) where
  attr OnAnimationstart value = unsafeAttribute
    { key: "animationstart ", value: cb' (Cb (const value)) }

type OnAnimationstartEffect =
  forall element
   . Attr element OnAnimationstart (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnAnimationstart Unit where
  attr OnAnimationstart _ = unsafeAttribute
    { key: "animationstart ", value: unset' }
