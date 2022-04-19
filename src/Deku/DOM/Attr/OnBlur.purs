module Deku.DOM.Attr.OnBlur where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnBlur = OnBlur
instance Attr anything OnBlur Cb where
  attr OnBlur value = unsafeAttribute { key: "blur", value: cb' value }