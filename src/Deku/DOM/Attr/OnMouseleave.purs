module Deku.DOM.Attr.OnMouseleave where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnMouseleave = OnMouseleave
instance Attr anything OnMouseleave Cb where
  attr OnMouseleave value = unsafeAttribute { key: "mouseleave", value: cb' value }
instance Attr anything OnMouseleave (Effect Unit) where
  attr OnMouseleave value = unsafeAttribute { key: "mouseleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseleave (Effect Boolean) where
  attr OnMouseleave value = unsafeAttribute { key: "mouseleave", value: cb' (Cb (const value)) }