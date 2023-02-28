module Deku.DOM.Attr.OnPointerout where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerout = OnPointerout

instance Attr anything OnPointerout Cb where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' value }

instance Attr anything OnPointerout (Effect Unit) where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerout (Effect Boolean) where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' (Cb (const value)) }

type OnPointeroutEffect =
  forall element
   . Attr element OnPointerout (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerout Unit where
  attr OnPointerout _ = unsafeAttribute
    { key: "pointerout", value: unset' }
