module Deku.DOM.Attr.OnDragend where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDragend = OnDragend
instance Attr anything OnDragend Cb where
  attr OnDragend value = unsafeAttribute { key: "dragend", value: cb' value }