module Deku.DOM.Attr.ShapeRendering where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data ShapeRendering = ShapeRendering

instance Deku.Attribute.Attr everything ShapeRendering Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "shape-rendering", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything ShapeRendering String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "shape-rendering", value: _ } <<<
    Deku.Attribute.prop'
