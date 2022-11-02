module Deku.DOM.Attr.OnProgress where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnProgress = OnProgress

instance Attr anything OnProgress Cb where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' value }

instance Attr anything OnProgress (Effect Unit) where
  attr OnProgress value = unsafeAttribute
    { key: "progress", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnProgress (Effect Boolean) where
  attr OnProgress value = unsafeAttribute
    { key: "progress", value: cb' (Cb (const value)) }