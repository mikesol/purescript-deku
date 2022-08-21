module Deku.DOM.Attr.OnScroll where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)
import Hyrule.Zora (Zora, runImpure)

data OnScroll = OnScroll

instance Attr anything OnScroll Cb where
  attr OnScroll value = unsafeAttribute { key: "scroll", value: cb' value }

instance Attr anything OnScroll (Effect Unit) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnScroll (Effect Boolean) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const value)) }

instance Attr anything OnScroll (Zora Unit) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const (runImpure (value $> true)))) }

instance Attr anything OnScroll (Zora Boolean) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const (runImpure value))) }