module Deku.DOM.Attr.StrokeSize where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeSize = StrokeSize

instance Deku.Attribute.Attr everything StrokeSize Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-size", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeSize String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-size", value: _ } <<<
    Deku.Attribute.prop'
