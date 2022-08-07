module Deku.DOM.Attr.OnDrag where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnDrag = OnDrag

instance Attr anything OnDrag Cb where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' value }

instance Attr anything OnDrag (Effect Unit) where
  attr OnDrag value = unsafeAttribute
    { key: "drag", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnDrag (Effect Boolean) where
  attr OnDrag value = unsafeAttribute
    { key: "drag", value: cb' (Cb (const value)) }