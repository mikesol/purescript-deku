module Deku.DOM.Attr.OnAbort where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnAbort = OnAbort

instance Attr anything OnAbort Cb where
  attr OnAbort value = unsafeAttribute { key: "abort", value: cb' value }

instance Attr anything OnAbort (Effect Unit) where
  attr OnAbort value = unsafeAttribute
    { key: "abort", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnAbort (Effect Boolean) where
  attr OnAbort value = unsafeAttribute
    { key: "abort", value: cb' (Cb (const value)) }