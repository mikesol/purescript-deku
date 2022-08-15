module Deku.DOM.Attr.OnPointerleave where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnPointerleave = OnPointerleave
instance Attr anything OnPointerleave Cb where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb' value }
instance Attr anything OnPointerleave (Effect Unit) where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnPointerleave (Effect Boolean) where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb' (Cb (const value)) }
instance Attr anything OnPointerleave (Zora Unit) where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnPointerleave (Zora Boolean) where
  attr OnPointerleave value = unsafeAttribute { key: "pointerleave", value: cb' (Cb (const (runImpure value))) }