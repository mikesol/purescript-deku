module Deku.DOM.Attr.OnSlotchange where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSlotchange = OnSlotchange
instance Attr anything OnSlotchange Cb where
  attr OnSlotchange value = unsafeAttribute { key: "slotchange", value: cb' value }