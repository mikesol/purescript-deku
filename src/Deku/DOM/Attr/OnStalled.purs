module Deku.DOM.Attr.OnStalled where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnStalled = OnStalled
instance Attr anything OnStalled Cb where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb' value }
instance Attr anything OnStalled (Effect Unit) where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnStalled (Effect Boolean) where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb' (Cb (const value)) }