module Deku.DOM.Attr.OnSelect where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSelect = OnSelect
instance Attr anything OnSelect Cb where
  attr OnSelect value = unsafeAttribute { key: "select", value: cb' value }