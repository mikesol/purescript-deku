module Deku.DOM.Attr.OnStalled where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnStalled = OnStalled
instance Attr anything OnStalled Cb where
  attr OnStalled value = unsafeAttribute { key: "stalled", value: cb' value }