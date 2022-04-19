module Deku.DOM.Attr.OnLoadend where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnLoadend = OnLoadend
instance Attr anything OnLoadend Cb where
  attr OnLoadend value = unsafeAttribute { key: "loadend", value: cb' value }