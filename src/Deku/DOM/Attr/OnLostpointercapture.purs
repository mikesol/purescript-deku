module Deku.DOM.Attr.OnLostpointercapture where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnLostpointercapture = OnLostpointercapture
instance Attr anything OnLostpointercapture Cb where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' value }
instance Attr anything OnLostpointercapture (Effect Unit) where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnLostpointercapture (Effect Boolean) where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' (Cb (const value)) }
instance Attr anything OnLostpointercapture (Zora Unit) where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' (Cb (const (runImpure (value $> true)))) }
instance Attr anything OnLostpointercapture (Zora Boolean) where
  attr OnLostpointercapture value = unsafeAttribute { key: "lostpointercapture", value: cb' (Cb (const (runImpure value))) }