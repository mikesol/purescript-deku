module Deku.DOM.Attr.OnLostpointercapture where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)


data OnLostpointercapture = OnLostpointercapture
instance Attr anything OnLostpointercapture Cb where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' value }
instance Attr anything OnLostpointercapture (Effect Unit) where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLostpointercapture (Effect Boolean) where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' (Cb (const value)) }