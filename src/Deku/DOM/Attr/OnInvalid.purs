module Deku.DOM.Attr.OnInvalid where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnInvalid = OnInvalid

instance Attr anything OnInvalid Cb where
  attr OnInvalid value = unsafeAttribute { key: "invalid", value: cb' value }

instance Attr anything OnInvalid (Effect Unit) where
  attr OnInvalid value = unsafeAttribute
    { key: "invalid", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInvalid (Effect Boolean) where
  attr OnInvalid value = unsafeAttribute
    { key: "invalid", value: cb' (Cb (const value)) }

instance Attr anything OnInvalid (Zora Unit) where
  attr OnInvalid value = unsafeAttribute
    { key: "invalid", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnInvalid (Zora Boolean) where
  attr OnInvalid value = unsafeAttribute
    { key: "invalid", value: cb' (Cb (const (runImpure value))) }