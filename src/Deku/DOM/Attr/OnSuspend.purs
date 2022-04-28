module Deku.DOM.Attr.OnSuspend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnSuspend = OnSuspend
instance Attr anything OnSuspend Cb where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' value }
instance Attr anything OnSuspend (Effect Unit) where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnSuspend (Effect Boolean) where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' (Cb (const value)) }