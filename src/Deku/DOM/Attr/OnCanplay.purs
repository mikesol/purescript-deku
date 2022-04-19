module Deku.DOM.Attr.OnCanplay where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnCanplay = OnCanplay
instance Attr anything OnCanplay Cb where
  attr OnCanplay value = unsafeAttribute { key: "canplay", value: cb' value }