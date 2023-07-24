module Deku.DOM.Attr.StrokeRepeat where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeRepeat = StrokeRepeat

instance Deku.Attribute.Attr everything StrokeRepeat Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-repeat", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeRepeat String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-repeat", value: _ } <<<
    Deku.Attribute.prop'
