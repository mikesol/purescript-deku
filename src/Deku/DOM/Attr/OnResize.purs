module Deku.DOM.Attr.OnResize where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnResize = OnResize

instance Attr anything OnResize Cb where
  attr OnResize value = unsafeAttribute { key: "resize", value: cb' value }

instance Attr anything OnResize (Effect Unit) where
  attr OnResize value = unsafeAttribute
    { key: "resize", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnResize (Effect Boolean) where
  attr OnResize value = unsafeAttribute
    { key: "resize", value: cb' (Cb (const value)) }