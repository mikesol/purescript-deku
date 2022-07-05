module Deku.DOM.Attr.OnReset where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnReset = OnReset
instance Attr anything OnReset Cb where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' value }
instance Attr anything OnReset (Effect Unit) where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnReset (Effect Boolean) where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' (Cb (const value)) }