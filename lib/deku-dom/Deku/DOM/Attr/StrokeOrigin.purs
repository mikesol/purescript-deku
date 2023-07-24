module Deku.DOM.Attr.StrokeOrigin where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeOrigin = StrokeOrigin

instance Deku.Attribute.Attr everything StrokeOrigin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-origin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeOrigin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-origin", value: _ } <<<
    Deku.Attribute.prop'
