module Deku.DOM.Attr.OnDragstart where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDragstart = OnDragstart
instance Attr anything OnDragstart Cb where
  attr OnDragstart value = unsafeAttribute { key: "dragstart", value: cb' value }