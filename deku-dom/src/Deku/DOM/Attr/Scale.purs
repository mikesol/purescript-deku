module Deku.DOM.Attr.Scale where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeDisplacementMap (FeDisplacementMap_)

data Scale = Scale

instance Deku.Attribute.Attr everything Scale Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "scale", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDisplacementMap_ Scale String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "scale", value: _ } <<< Deku.Attribute.prop'
