module Deku.DOM.Attr.StrokeColor where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeColor = StrokeColor

instance Deku.Attribute.Attr everything StrokeColor Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-color", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeColor String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-color", value: _ } <<<
    Deku.Attribute.prop'
