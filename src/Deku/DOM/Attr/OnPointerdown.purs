module Deku.DOM.Attr.OnPointerdown where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute, unset')
import FRP.Event (Event)

data OnPointerdown = OnPointerdown

instance Attr anything OnPointerdown Cb where
  attr OnPointerdown value = unsafeAttribute
    { key: "pointerdown", value: cb' value }

instance Attr anything OnPointerdown (Effect Unit) where
  attr OnPointerdown value = unsafeAttribute
    { key: "pointerdown", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerdown (Effect Boolean) where
  attr OnPointerdown value = unsafeAttribute
    { key: "pointerdown", value: cb' (Cb (const value)) }

type OnPointerdownEffect =
  forall element
   . Attr element OnPointerdown (Effect Unit)
  => Event (Attribute element)

instance Attr everything OnPointerdown Unit where
  attr OnPointerdown _ = unsafeAttribute
    { key: "pointerdown", value: unset' }
