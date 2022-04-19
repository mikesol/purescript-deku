module Deku.DOM.Attr.OnInvalid where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnInvalid = OnInvalid
instance Attr anything OnInvalid Cb where
  attr OnInvalid value = unsafeAttribute { key: "invalid", value: cb' value }