module Deku.DOM.Attr.OnSubmit where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSubmit = OnSubmit
instance Attr anything OnSubmit Cb where
  attr OnSubmit value = unsafeAttribute { key: "submit", value: cb' value }