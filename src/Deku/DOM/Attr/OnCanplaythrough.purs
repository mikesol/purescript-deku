module Deku.DOM.Attr.OnCanplaythrough where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnCanplaythrough = OnCanplaythrough
instance Attr anything OnCanplaythrough Cb where
  attr OnCanplaythrough value = unsafeAttribute { key: "canplaythrough", value: cb' value }