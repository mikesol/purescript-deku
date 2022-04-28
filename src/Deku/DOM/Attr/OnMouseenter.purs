module Deku.DOM.Attr.OnMouseenter where

import Prelude
import Effect (Effect)
import Deku.Attribute (class Attr, Cb(..), cb', cb, unsafeAttribute)

data OnMouseenter = OnMouseenter
instance Attr anything OnMouseenter Cb where
  attr OnMouseenter value = unsafeAttribute { key: "mouseenter", value: cb' value }
instance Attr anything OnMouseenter (Effect Unit) where
  attr OnMouseenter value = unsafeAttribute { key: "mouseenter", value: cb' (Cb (const (value $> true))) }
instance Attr anything OnMouseenter (Effect Boolean) where
  attr OnMouseenter value = unsafeAttribute { key: "mouseenter", value: cb' (Cb (const value)) }