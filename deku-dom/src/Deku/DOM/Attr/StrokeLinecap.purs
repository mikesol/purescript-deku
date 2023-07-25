module Deku.DOM.Attr.StrokeLinecap where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeLinecap = StrokeLinecap

instance Deku.Attribute.Attr everything StrokeLinecap Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-linecap", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeLinecap String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-linecap", value: _ } <<<
    Deku.Attribute.prop'
