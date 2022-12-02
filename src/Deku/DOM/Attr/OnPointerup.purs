module Deku.DOM.Attr.OnPointerup where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnPointerup = OnPointerup

instance Attr anything OnPointerup Cb where
  attr OnPointerup value = unsafeAttribute
    { key: "pointerup", value: cb' value }

instance Attr anything OnPointerup (Effect Unit) where
  attr OnPointerup value = unsafeAttribute
    { key: "pointerup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointerup (Effect Boolean) where
  attr OnPointerup value = unsafeAttribute
    { key: "pointerup", value: cb' (Cb (const value)) }

type OnPointerupEffect = forall element. Attr element OnPointerup (Effect Unit) => Event (Attribute element)
