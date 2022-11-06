module Deku.DOM.Attr.Accelerate where

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Accelerate = Accelerate

instance Attr AnimateTransform_ Accelerate String where
  attr Accelerate value = unsafeAttribute { key: "accelerate", value: prop' value }