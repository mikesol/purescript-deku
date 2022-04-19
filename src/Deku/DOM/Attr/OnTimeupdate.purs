module Deku.DOM.Attr.OnTimeupdate where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnTimeupdate = OnTimeupdate
instance Attr anything OnTimeupdate Cb where
  attr OnTimeupdate value = unsafeAttribute { key: "timeupdate", value: cb' value }