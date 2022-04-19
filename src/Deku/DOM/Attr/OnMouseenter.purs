module Deku.DOM.Attr.OnMouseenter where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMouseenter = OnMouseenter
instance Attr anything OnMouseenter Cb where
  attr OnMouseenter value = unsafeAttribute { key: "mouseenter", value: cb' value }