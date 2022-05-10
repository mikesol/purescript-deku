module Deku.DOM.Attr.OnMouseover where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnMouseover = OnMouseover

instance Attr anything OnMouseover Cb where
  attr OnMouseover value = unsafeAttribute
    { key: "mouseover", value: cb' value }

instance Attr anything OnMouseover (Effect Unit) where
  attr OnMouseover value = unsafeAttribute
    { key: "mouseover", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMouseover (Effect Boolean) where
  attr OnMouseover value = unsafeAttribute
    { key: "mouseover", value: cb' (Cb (const value)) }