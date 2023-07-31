module Deku.DOM.Attr.StrokePosition where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokePosition = StrokePosition

instance Deku.Attribute.Attr everything StrokePosition Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-position", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokePosition String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-position", value: _ } <<<
    Deku.Attribute.prop'
