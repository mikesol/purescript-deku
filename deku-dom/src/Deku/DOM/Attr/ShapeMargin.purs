module Deku.DOM.Attr.ShapeMargin where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data ShapeMargin = ShapeMargin

instance Deku.Attribute.Attr everything ShapeMargin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "shape-margin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything ShapeMargin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "shape-margin", value: _ } <<<
    Deku.Attribute.prop'
