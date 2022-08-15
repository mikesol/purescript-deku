module Deku.DOM.Attr.OnPointercancel where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnPointercancel = OnPointercancel
instance Attr anything OnPointercancel Cb where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb' value }
instance Attr anything OnPointercancel (Effect Unit) where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointercancel (Effect Boolean) where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb' (Cb (const value)) }
instance Attr anything OnPointercancel (Zora Unit) where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnPointercancel (Zora Boolean) where
  attr OnPointercancel value = unsafeAttribute { key: "pointercancel", value: cb' (Cb (const (runImpure value))) }