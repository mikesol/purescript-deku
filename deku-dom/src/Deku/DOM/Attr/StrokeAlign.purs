module Deku.DOM.Attr.StrokeAlign where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeAlign = StrokeAlign

instance Deku.Attribute.Attr everything StrokeAlign Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-align", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeAlign String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-align", value: _ } <<<
    Deku.Attribute.prop'
