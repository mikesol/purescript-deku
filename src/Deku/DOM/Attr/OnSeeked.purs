module Deku.DOM.Attr.OnSeeked where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSeeked = OnSeeked
instance Attr anything OnSeeked Cb where
  attr OnSeeked value = unsafeAttribute { key: "seeked", value: cb' value }