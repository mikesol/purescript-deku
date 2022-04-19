module Deku.DOM.Attr.OnFocus where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnFocus = OnFocus
instance Attr anything OnFocus Cb where
  attr OnFocus value = unsafeAttribute { key: "focus", value: cb' value }