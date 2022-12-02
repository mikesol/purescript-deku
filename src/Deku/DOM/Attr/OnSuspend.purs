module Deku.DOM.Attr.OnSuspend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Attribute, Cb(..), cb', unsafeAttribute)
import FRP.Event (Event)

data OnSuspend = OnSuspend

instance Attr anything OnSuspend Cb where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' value }

instance Attr anything OnSuspend (Effect Unit) where
  attr OnSuspend value = unsafeAttribute
    { key: "suspend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnSuspend (Effect Boolean) where
  attr OnSuspend value = unsafeAttribute
    { key: "suspend", value: cb' (Cb (const value)) }

type OnSuspendEffect = forall element. Attr element OnSuspend (Effect Unit) => Event (Attribute element)
