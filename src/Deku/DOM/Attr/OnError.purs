module Deku.DOM.Attr.OnError where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnError = OnError
instance Attr anything OnError Cb where
  attr OnError value = unsafeAttribute { key: "error", value: cb' value }
instance Attr anything OnError (Effect Unit) where
  attr OnError value = unsafeAttribute { key: "error", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnError (Effect Boolean) where
  attr OnError value = unsafeAttribute { key: "error", value: cb' (Cb (const value)) }