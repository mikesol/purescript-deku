module Deku.DOM.Attr.SpecularConstant where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeSpecularLighting (FeSpecularLighting_)

data SpecularConstant = SpecularConstant

instance Deku.Attribute.Attr everything SpecularConstant Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "specularConstant", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeSpecularLighting_ SpecularConstant String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "specularConstant", value: _ } <<<
    Deku.Attribute.prop'
