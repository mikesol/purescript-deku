module Deku.DOM.Attr.SpecularConstant where

import Prelude

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data SpecularConstant = SpecularConstant

instance Attr FeSpecularLighting_ SpecularConstant String where
  attr SpecularConstant value = unsafeAttribute
    { key: "specularConstant", value: prop' value }

instance Attr everything SpecularConstant Unit where
  attr SpecularConstant _ = unsafeAttribute
    { key: "specularConstant", value: unset' }
