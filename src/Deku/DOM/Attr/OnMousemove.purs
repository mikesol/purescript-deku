module Deku.DOM.Attr.OnMousemove where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', unsafeAttribute)

data OnMousemove = OnMousemove

instance Attr anything OnMousemove Cb where
  attr OnMousemove value = unsafeAttribute
    { key: "mousemove", value: cb' value }

instance Attr anything OnMousemove (Effect Unit) where
  attr OnMousemove value = unsafeAttribute
    { key: "mousemove", value: cb' (Cb (const (value $> true))) }

instance Attr anything OnMousemove (Effect Boolean) where
  attr OnMousemove value = unsafeAttribute
    { key: "mousemove", value: cb' (Cb (const value)) }