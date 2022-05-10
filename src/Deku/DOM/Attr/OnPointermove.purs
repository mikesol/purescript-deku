module Deku.DOM.Attr.OnPointermove where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnPointermove = OnPointermove

instance Attr anything OnPointermove Cb where
  attr OnPointermove value = unsafeAttribute
    { key: "pointermove", value: cb' value }

instance Attr anything OnPointermove (Effect Unit) where
  attr OnPointermove value = unsafeAttribute
    { key: "pointermove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnPointermove (Effect Boolean) where
  attr OnPointermove value = unsafeAttribute
    { key: "pointermove", value: cb' (Cb (const value)) }