module Deku.DOM.Attr.OnPointermove where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointermove = OnPointermove
instance Attr anything OnPointermove Cb where
  attr OnPointermove value = unsafeAttribute { key: "pointermove", value: cb' value }