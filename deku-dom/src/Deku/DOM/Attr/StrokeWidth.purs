module Deku.DOM.Attr.StrokeWidth where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeWidth = StrokeWidth

instance Deku.Attribute.Attr everything StrokeWidth Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-width", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeWidth String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-width", value: _ } <<<
    Deku.Attribute.prop'
