module Deku.DOM.Attr.OnPointerdown where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

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

instance Attr anything OnPointerdown (Zora Unit) where
  attr OnPointerdown value = unsafeAttribute
    { key: "pointerdown", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnPointerdown (Zora Boolean) where
  attr OnPointerdown value = unsafeAttribute
    { key: "pointerdown", value: cb' (Cb (const (runImpure value))) }