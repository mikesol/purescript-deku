module Deku.DOM.Attr.DiffuseConstant where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeDiffuseLighting (FeDiffuseLighting_)

data DiffuseConstant = DiffuseConstant

instance Deku.Attribute.Attr everything DiffuseConstant Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "diffuseConstant", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDiffuseLighting_ DiffuseConstant String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "diffuseConstant", value: _ } <<<
    Deku.Attribute.prop'
