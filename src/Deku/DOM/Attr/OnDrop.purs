module Deku.DOM.Attr.OnDrop where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnDrop = OnDrop

instance Attr anything OnDrop Cb where
  attr OnDrop value = unsafeAttribute { key: "drop", value: cb' value }

instance Attr anything OnDrop (Effect Unit) where
  attr OnDrop value = unsafeAttribute
    { key: "drop", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrop (Effect Boolean) where
  attr OnDrop value = unsafeAttribute
    { key: "drop", value: cb' (Cb (const value)) }