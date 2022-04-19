module Deku.DOM.Attr.OnMouseout where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnMouseout = OnMouseout
instance Attr anything OnMouseout Cb where
  attr OnMouseout value = unsafeAttribute { key: "mouseout", value: cb' value }