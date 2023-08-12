module Deku.DOM.Attr.Accelerate where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Accelerate = Accelerate

instance Attr AnimateTransform_ Accelerate String where
  attr Accelerate value = unsafeAttribute
    { key: "accelerate", value: prop' value }

instance Attr everything Accelerate Unit where
  attr Accelerate _ = unsafeAttribute
    { key: "accelerate", value: unset' }
