module Deku.DOM.Attr.OnScroll where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnScroll = OnScroll

instance Attr anything OnScroll Cb where
  attr OnScroll value = unsafeAttribute { key: "scroll", value: cb' value }

instance Attr anything OnScroll (Effect Unit) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnScroll (Effect Boolean) where
  attr OnScroll value = unsafeAttribute
    { key: "scroll", value: cb' (Cb (const value)) }