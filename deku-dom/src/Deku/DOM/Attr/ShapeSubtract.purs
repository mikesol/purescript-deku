module Deku.DOM.Attr.ShapeSubtract where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data ShapeSubtract = ShapeSubtract

instance Deku.Attribute.Attr everything ShapeSubtract Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "shape-subtract", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything ShapeSubtract String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "shape-subtract", value: _ } <<<
    Deku.Attribute.prop'
