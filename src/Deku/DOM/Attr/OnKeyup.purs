module Deku.DOM.Attr.OnKeyup where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnKeyup = OnKeyup
instance Attr anything OnKeyup Cb where
  attr OnKeyup value = unsafeAttribute { key: "keyup", value: cb' value }