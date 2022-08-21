module Deku.DOM.Attr.OnInput where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnInput = OnInput

instance Attr anything OnInput Cb where
  attr OnInput value = unsafeAttribute { key: "input", value: cb' value }

instance Attr anything OnInput (Effect Unit) where
  attr OnInput value = unsafeAttribute
    { key: "input", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnInput (Effect Boolean) where
  attr OnInput value = unsafeAttribute
    { key: "input", value: cb' (Cb (const value)) }

instance Attr anything OnInput (Zora Unit) where
  attr OnInput value = unsafeAttribute
    { key: "input", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnInput (Zora Boolean) where
  attr OnInput value = unsafeAttribute
    { key: "input", value: cb' (Cb (const (runImpure value))) }