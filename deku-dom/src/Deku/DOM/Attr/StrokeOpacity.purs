module Deku.DOM.Attr.StrokeOpacity where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeOpacity = StrokeOpacity

instance Deku.Attribute.Attr everything StrokeOpacity Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-opacity", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeOpacity String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-opacity", value: _ } <<<
    Deku.Attribute.prop'
