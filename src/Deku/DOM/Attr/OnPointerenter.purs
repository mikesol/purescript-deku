module Deku.DOM.Attr.OnPointerenter where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerenter = OnPointerenter

instance Attr anything OnPointerenter Cb where
  attr OnPointerenter value = unsafeAttribute
    { key: "pointerenter", value: cb' value }

instance Attr anything OnPointerenter (Effect Unit) where
  attr OnPointerenter value = unsafeAttribute
    { key: "pointerenter", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerenter (Effect Boolean) where
  attr OnPointerenter value = unsafeAttribute
    { key: "pointerenter", value: cb' (Cb (const value)) }

type OnPointerenterEffect =
  forall element
   . Attr element OnPointerenter (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerenter Unit where
  attr OnPointerenter _ = unsafeAttribute
    { key: "pointerenter", value: unset' }
