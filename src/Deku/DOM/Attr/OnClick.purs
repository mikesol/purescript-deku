module Deku.DOM.Attr.OnClick where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnClick = OnClick
instance Attr anything OnClick Cb where
  attr OnClick value = unsafeAttribute { key: "click", value: cb' value }