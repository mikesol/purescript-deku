module Deku.DOM.Attr.OnKeydown where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnKeydown = OnKeydown
instance Attr anything OnKeydown Cb where
  attr OnKeydown value = unsafeAttribute { key: "keydown", value: cb' value }