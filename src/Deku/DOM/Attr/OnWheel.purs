module Deku.DOM.Attr.OnWheel where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnWheel = OnWheel
instance Attr anything OnWheel Cb where
  attr OnWheel value = unsafeAttribute { key: "wheel", value: cb' value }