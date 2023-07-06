module Deku.DOM.Attr.DiffuseConstant where

import Prelude

import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data DiffuseConstant = DiffuseConstant

instance Attr FeDiffuseLighting_ DiffuseConstant String where
  attr DiffuseConstant value = unsafeAttribute
    { key: "diffuseConstant", value: prop' value }

instance Attr everything DiffuseConstant Unit where
  attr DiffuseConstant _ = unsafeAttribute
    { key: "diffuseConstant", value: unset' }
