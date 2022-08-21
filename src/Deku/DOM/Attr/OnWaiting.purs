module Deku.DOM.Attr.OnWaiting where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnWaiting = OnWaiting

instance Attr anything OnWaiting Cb where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' value }

instance Attr anything OnWaiting (Effect Unit) where
  attr OnWaiting value = unsafeAttribute
    { key: "waiting", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnWaiting (Effect Boolean) where
  attr OnWaiting value = unsafeAttribute
    { key: "waiting", value: cb' (Cb (const value)) }

instance Attr anything OnWaiting (Zora Unit) where
  attr OnWaiting value = unsafeAttribute
    { key: "waiting", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnWaiting (Zora Boolean) where
  attr OnWaiting value = unsafeAttribute
    { key: "waiting", value: cb' (Cb (const (runImpure value))) }