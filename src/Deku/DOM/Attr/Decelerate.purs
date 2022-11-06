module Deku.DOM.Attr.Decelerate where

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Decelerate = Decelerate

instance Attr AnimateTransform_ Decelerate String where
  attr Decelerate value = unsafeAttribute
    { key: "decelerate", value: prop' value }