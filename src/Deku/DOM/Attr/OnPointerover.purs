module Deku.DOM.Attr.OnPointerover where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerover = OnPointerover

instance Attr anything OnPointerover Cb where
  attr OnPointerover value = unsafeAttribute
    { key: "pointerover", value: cb' value }

instance Attr anything OnPointerover (Effect Unit) where
  attr OnPointerover value = unsafeAttribute
    { key: "pointerover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerover (Effect Boolean) where
  attr OnPointerover value = unsafeAttribute
    { key: "pointerover", value: cb' (Cb (const value)) }

type OnPointeroverEffect =
  forall element
   . Attr element OnPointerover (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerover Unit where
  attr OnPointerover _ = unsafeAttribute
    { key: "pointerover", value: unset' }
