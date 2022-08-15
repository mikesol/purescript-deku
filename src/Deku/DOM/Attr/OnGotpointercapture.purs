module Deku.DOM.Attr.OnGotpointercapture where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnGotpointercapture = OnGotpointercapture
instance Attr anything OnGotpointercapture Cb where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' value }
instance Attr anything OnGotpointercapture (Effect Unit) where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnGotpointercapture (Effect Boolean) where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnGotpointercapture (Zora Unit) where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnGotpointercapture (Zora Boolean) where
  attr OnGotpointercapture value = unsafeAttribute { key: "gotpointercapture", value: cb' (Cb (const (runImpure value))) }