module Deku.DOM.Attr.OnLoadend where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnLoadend = OnLoadend

instance Attr anything OnLoadend Cb where
  attr OnLoadend value = unsafeAttribute { key: "loadend", value: cb' value }

instance Attr anything OnLoadend (Effect Unit) where
  attr OnLoadend value = unsafeAttribute
    { key: "loadend", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnLoadend (Effect Boolean) where
  attr OnLoadend value = unsafeAttribute
    { key: "loadend", value: cb' (Cb (const value)) }