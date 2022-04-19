module Deku.DOM.Attr.OnMousewheel   where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMousewheel   = OnMousewheel  
instance Attr anything OnMousewheel   Cb where
  attr OnMousewheel   value = unsafeAttribute { key: "mousewheel  ", value: cb' value }