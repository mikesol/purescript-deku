module Deku.DOM.Attr.SpecularConstant where

import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data SpecularConstant = SpecularConstant

instance Attr FeSpecularLighting_ SpecularConstant String where
  attr SpecularConstant value = unsafeAttribute
    { key: "specularConstant", value: prop' value }