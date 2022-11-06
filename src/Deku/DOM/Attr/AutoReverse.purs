module Deku.DOM.Attr.AutoReverse where

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data AutoReverse = AutoReverse

instance Attr AnimateTransform_ AutoReverse String where
  attr AutoReverse value = unsafeAttribute
    { key: "autoReverse", value: prop' value }