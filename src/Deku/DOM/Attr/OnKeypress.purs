module Deku.DOM.Attr.OnKeypress where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnKeypress = OnKeypress
instance Attr anything OnKeypress Cb where
  attr OnKeypress value = unsafeAttribute { key: "keypress", value: cb' value }