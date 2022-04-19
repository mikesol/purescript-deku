module Deku.DOM.Attr.OnProgress where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnProgress = OnProgress
instance Attr anything OnProgress Cb where
  attr OnProgress value = unsafeAttribute { key: "progress", value: cb' value }