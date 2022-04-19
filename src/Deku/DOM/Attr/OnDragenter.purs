module Deku.DOM.Attr.OnDragenter where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDragenter = OnDragenter
instance Attr anything OnDragenter Cb where
  attr OnDragenter value = unsafeAttribute { key: "dragenter", value: cb' value }