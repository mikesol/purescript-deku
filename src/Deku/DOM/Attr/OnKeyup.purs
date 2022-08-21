module Deku.DOM.Attr.OnKeyup where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnKeyup = OnKeyup

instance Attr anything OnKeyup Cb where
  attr OnKeyup value = unsafeAttribute { key: "keyup", value: cb' value }

instance Attr anything OnKeyup (Effect Unit) where
  attr OnKeyup value = unsafeAttribute
    { key: "keyup", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnKeyup (Effect Boolean) where
  attr OnKeyup value = unsafeAttribute
    { key: "keyup", value: cb' (Cb (const value)) }

instance Attr anything OnKeyup (Zora Unit) where
  attr OnKeyup value = unsafeAttribute
    { key: "keyup", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnKeyup (Zora Boolean) where
  attr OnKeyup value = unsafeAttribute
    { key: "keyup", value: cb' (Cb (const (runImpure value))) }