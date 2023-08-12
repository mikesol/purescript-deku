module Deku.DOM.Attr.OnPointercancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointercancel = OnPointercancel

instance Attr anything OnPointercancel Cb where
  attr OnPointercancel value = unsafeAttribute
    { key: "pointercancel", value: cb' value }

instance Attr anything OnPointercancel (Effect Unit) where
  attr OnPointercancel value = unsafeAttribute
    { key: "pointercancel", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointercancel (Effect Boolean) where
  attr OnPointercancel value = unsafeAttribute
    { key: "pointercancel", value: cb' (Cb (const value)) }

type OnPointercancelEffect =
  forall element
   . Attr element OnPointercancel (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointercancel Unit where
  attr OnPointercancel _ = unsafeAttribute
    { key: "pointercancel", value: unset' }
