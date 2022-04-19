module Deku.DOM.Attr.OnInput where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnInput = OnInput
instance Attr anything OnInput Cb where
  attr OnInput value = unsafeAttribute { key: "input", value: cb' value }