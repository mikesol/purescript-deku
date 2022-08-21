module Deku.DOM.Attr.OnSuspend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnSuspend = OnSuspend

instance Attr anything OnSuspend Cb where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' value }

instance Attr anything OnSuspend (Effect Unit) where
  attr OnSuspend value = unsafeAttribute
    { key: "suspend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSuspend (Effect Boolean) where
  attr OnSuspend value = unsafeAttribute
    { key: "suspend", value: cb' (Cb (const value)) }

instance Attr anything OnSuspend (Zora Unit) where
  attr OnSuspend value = unsafeAttribute
    { key: "suspend", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnSuspend (Zora Boolean) where
  attr OnSuspend value = unsafeAttribute
    { key: "suspend", value: cb' (Cb (const (runImpure value))) }