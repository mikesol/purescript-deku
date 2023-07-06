module Deku.DOM.Attr.AttributeType where

import Prelude

import Deku.DOM.Elt.AnimateTransform (AnimateTransform_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data AttributeType = AttributeType

instance Attr AnimateTransform_ AttributeType String where
  attr AttributeType value = unsafeAttribute
    { key: "attributeType", value: prop' value }

instance Attr everything AttributeType Unit where
  attr AttributeType _ = unsafeAttribute
    { key: "attributeType", value: unset' }
