module Deku.DOM.Attr.ShapeInside where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data ShapeInside = ShapeInside

instance Deku.Attribute.Attr everything ShapeInside Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "shape-inside", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything ShapeInside String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "shape-inside", value: _ } <<<
    Deku.Attribute.prop'
