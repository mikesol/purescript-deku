module Deku.DOM.Attr.OnRatechange where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnRatechange = OnRatechange
instance Attr anything OnRatechange Cb where
  attr OnRatechange value = unsafeAttribute { key: "ratechange", value: cb' value }