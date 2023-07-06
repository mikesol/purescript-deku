module Deku.DOM.Attr.OnPointerleave where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerleave = OnPointerleave

instance Attr anything OnPointerleave Cb where
  attr OnPointerleave value = unsafeAttribute
    { key: "pointerleave", value: cb' value }

instance Attr anything OnPointerleave (Effect Unit) where
  attr OnPointerleave value = unsafeAttribute
    { key: "pointerleave", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerleave (Effect Boolean) where
  attr OnPointerleave value = unsafeAttribute
    { key: "pointerleave", value: cb' (Cb (const value)) }

type OnPointerleaveEffect =
  forall element
   . Attr element OnPointerleave (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerleave Unit where
  attr OnPointerleave _ = unsafeAttribute
    { key: "pointerleave", value: unset' }
