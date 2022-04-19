module Deku.DOM.Attr.OnDragleave where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDragleave = OnDragleave
instance Attr anything OnDragleave Cb where
  attr OnDragleave value = unsafeAttribute { key: "dragleave", value: cb' value }