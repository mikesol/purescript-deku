module Deku.DOM.Attr.OnWaiting where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnWaiting = OnWaiting
instance Attr anything OnWaiting Cb where
  attr OnWaiting value = unsafeAttribute { key: "waiting", value: cb' value }