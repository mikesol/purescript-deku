module Deku.DOM.Attr.OnClose where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnClose = OnClose
instance Attr anything OnClose Cb where
  attr OnClose value = unsafeAttribute { key: "close", value: cb' value }