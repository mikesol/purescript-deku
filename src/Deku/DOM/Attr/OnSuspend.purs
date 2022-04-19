module Deku.DOM.Attr.OnSuspend where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSuspend = OnSuspend
instance Attr anything OnSuspend Cb where
  attr OnSuspend value = unsafeAttribute { key: "suspend", value: cb' value }