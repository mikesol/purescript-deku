module Deku.DOM.Attr.OnAuxclick  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnAuxclick  = OnAuxclick 
instance Attr anything OnAuxclick  Cb where
  attr OnAuxclick  value = unsafeAttribute { key: "auxclick ", value: cb' value }