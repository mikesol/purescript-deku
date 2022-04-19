module Deku.DOM.Attr.OnAbort where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnAbort = OnAbort
instance Attr anything OnAbort Cb where
  attr OnAbort value = unsafeAttribute { key: "abort", value: cb' value }