module Deku.DOM.Attr.OnReset where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnReset = OnReset

instance Attr anything OnReset Cb where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' value }

instance Attr anything OnReset (Effect Unit) where
  attr OnReset value = unsafeAttribute
    { key: "reset", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnReset (Effect Boolean) where
  attr OnReset value = unsafeAttribute
    { key: "reset", value: cb' (Cb (const value)) }

instance Attr anything OnReset (Zora Unit) where
  attr OnReset value = unsafeAttribute
    { key: "reset", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnReset (Zora Boolean) where
  attr OnReset value = unsafeAttribute
    { key: "reset", value: cb' (Cb (const (runImpure value))) }