module Deku.DOM.Attr.OnLoadstart where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnLoadstart = OnLoadstart
instance Attr anything OnLoadstart Cb where
  attr OnLoadstart value = unsafeAttribute { key: "loadstart", value: cb' value }