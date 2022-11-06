module Deku.DOM.Attr.AttributeType where

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data AttributeType = AttributeType

instance Attr AnimateTransform_ AttributeType String where
  attr AttributeType value = unsafeAttribute { key: "attributeType", value: prop' value }