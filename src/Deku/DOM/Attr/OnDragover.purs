module Deku.DOM.Attr.OnDragover where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDragover = OnDragover
instance Attr anything OnDragover Cb where
  attr OnDragover value = unsafeAttribute { key: "dragover", value: cb' value }