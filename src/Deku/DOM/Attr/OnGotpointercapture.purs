module Deku.DOM.Attr.OnGotpointercapture where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnGotpointercapture = OnGotpointercapture
instance Attr anything OnGotpointercapture Cb where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' value }