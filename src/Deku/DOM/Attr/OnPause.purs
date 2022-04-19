module Deku.DOM.Attr.OnPause where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPause = OnPause
instance Attr anything OnPause Cb where
  attr OnPause value = unsafeAttribute { key: "pause", value: cb' value }