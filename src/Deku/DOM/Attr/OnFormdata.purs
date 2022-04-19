module Deku.DOM.Attr.OnFormdata where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnFormdata = OnFormdata
instance Attr anything OnFormdata Cb where
  attr OnFormdata value = unsafeAttribute { key: "formdata", value: cb' value }