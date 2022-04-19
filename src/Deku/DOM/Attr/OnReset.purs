module Deku.DOM.Attr.OnReset where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnReset = OnReset
instance Attr anything OnReset Cb where
  attr OnReset value = unsafeAttribute { key: "reset", value: cb' value }