module Deku.DOM.Attr.OnDragleave where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnDragleave = OnDragleave
instance Attr anything OnDragleave Cb where
  attr OnDragleave value = unsafeAttribute { key: "dragleave", value: cb' value }
instance Attr anything OnDragleave (Effect Unit) where
  attr OnDragleave value = unsafeAttribute { key: "dragleave", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnDragleave (Effect Boolean) where
  attr OnDragleave value = unsafeAttribute { key: "dragleave", value: cb' (Cb (const value)) }