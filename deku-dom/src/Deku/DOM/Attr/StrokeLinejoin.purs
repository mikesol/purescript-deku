module Deku.DOM.Attr.StrokeLinejoin where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeLinejoin = StrokeLinejoin

instance Deku.Attribute.Attr everything StrokeLinejoin Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-linejoin", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeLinejoin String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-linejoin", value: _ } <<<
    Deku.Attribute.prop'
