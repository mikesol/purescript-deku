module Deku.DOM.Attr.OnPointerout where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

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

instance Attr anything OnPointerout (Zora Unit) where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnPointerout (Zora Boolean) where
  attr OnPointerout value = unsafeAttribute
    { key: "pointerout", value: cb' (Cb (const (runImpure value))) }