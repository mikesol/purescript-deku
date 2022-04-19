module Deku.DOM.Attr.OnDrag where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDrag = OnDrag
instance Attr anything OnDrag Cb where
  attr OnDrag value = unsafeAttribute { key: "drag", value: cb' value }