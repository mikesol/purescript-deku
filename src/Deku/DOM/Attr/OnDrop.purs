module Deku.DOM.Attr.OnDrop where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDrop = OnDrop
instance Attr anything OnDrop Cb where
  attr OnDrop value = unsafeAttribute { key: "drop", value: cb' value }