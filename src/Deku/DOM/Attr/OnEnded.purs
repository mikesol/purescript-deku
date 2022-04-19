module Deku.DOM.Attr.OnEnded where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnEnded = OnEnded
instance Attr anything OnEnded Cb where
  attr OnEnded value = unsafeAttribute { key: "ended", value: cb' value }