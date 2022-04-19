module Deku.DOM.Attr.OnDurationchange where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnDurationchange = OnDurationchange
instance Attr anything OnDurationchange Cb where
  attr OnDurationchange value = unsafeAttribute { key: "durationchange", value: cb' value }