module Deku.DOM.Attr.OnError where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnError = OnError
instance Attr anything OnError Cb where
  attr OnError value = unsafeAttribute { key: "error", value: cb' value }