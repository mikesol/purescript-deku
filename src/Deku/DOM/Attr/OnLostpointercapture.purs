module Deku.DOM.Attr.OnLostpointercapture where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnLostpointercapture = OnLostpointercapture
instance Attr anything OnLostpointercapture Cb where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' value }