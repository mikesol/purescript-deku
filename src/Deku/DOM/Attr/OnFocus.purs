module Deku.DOM.Attr.OnFocus where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnFocus = OnFocus

instance Attr anything OnFocus Cb where
  attr OnFocus value = unsafeAttribute { key: "focus", value: cb' value }

instance Attr anything OnFocus (Effect Unit) where
  attr OnFocus value = unsafeAttribute
    { key: "focus", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnFocus (Effect Boolean) where
  attr OnFocus value = unsafeAttribute
    { key: "focus", value: cb' (Cb (const value)) }