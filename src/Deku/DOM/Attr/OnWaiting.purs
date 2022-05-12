module Deku.DOM.Attr.OnWaiting where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnWaiting = OnWaiting
instance Attr anything OnWaiting Cb where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' value }
instance Attr anything OnWaiting (Effect Unit) where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnWaiting (Effect Boolean) where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' (Cb (const value)) }