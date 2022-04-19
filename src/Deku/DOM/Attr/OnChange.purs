module Deku.DOM.Attr.OnChange where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnChange = OnChange
instance Attr anything OnChange Cb where
  attr OnChange value = unsafeAttribute { key: "change", value: cb' value }