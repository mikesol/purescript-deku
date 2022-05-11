module Deku.DOM.Attr.OnGotpointercapture where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnGotpointercapture = OnGotpointercapture
instance Attr anything OnGotpointercapture Cb where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' value }
instance Attr anything OnGotpointercapture (Effect Unit) where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnGotpointercapture (Effect Boolean) where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' (Cb (const value)) }