module Deku.DOM.Attr.OnClose where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnClose = OnClose

instance Attr anything OnClose Cb where
  attr OnClose value = unsafeAttribute { key: "close", value: cb' value }

instance Attr anything OnClose (Effect Unit) where
  attr OnClose value = unsafeAttribute
    { key: "close", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnClose (Effect Boolean) where
  attr OnClose value = unsafeAttribute
    { key: "close", value: cb' (Cb (const value)) }