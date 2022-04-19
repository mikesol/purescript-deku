module Deku.DOM.Attr.OnPointerlockchange  where

import Deku.Attribute (class Attr, Cb, cb', unsafeAttribute)

data OnPointerlockchange  = OnPointerlockchange 
instance Attr anything OnPointerlockchange  Cb where
  attr OnPointerlockchange  value = unsafeAttribute { key: "pointerlockchange ", value: cb' value }