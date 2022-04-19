module Deku.DOM.Attr.OnSelectstart where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnSelectstart = OnSelectstart
instance Attr anything OnSelectstart Cb where
  attr OnSelectstart value = unsafeAttribute { key: "selectstart", value: cb' value }