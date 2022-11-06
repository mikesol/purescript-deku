module Deku.DOM.Attr.DiffuseConstant where

import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data DiffuseConstant = DiffuseConstant

instance Attr FeDiffuseLighting_ DiffuseConstant String where
  attr DiffuseConstant value = unsafeAttribute { key: "diffuseConstant", value: prop' value }