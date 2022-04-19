module Deku.DOM.Attr.OnShow  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnShow  = OnShow 
instance Attr anything OnShow  Cb where
  attr OnShow  value = unsafeAttribute { key: "show ", value: cb' value }