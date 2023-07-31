module Deku.DOM.Attr.StrokeDashCorner where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeDashCorner = StrokeDashCorner

instance Deku.Attribute.Attr everything StrokeDashCorner Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "stroke-dash-corner", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeDashCorner String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-dash-corner", value: _ } <<<
    Deku.Attribute.prop'
