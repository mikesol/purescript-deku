module Deku.DOM.Attr.StrokeBreak where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeBreak = StrokeBreak

instance Deku.Attribute.Attr everything StrokeBreak Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-break", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeBreak String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-break", value: _ } <<<
    Deku.Attribute.prop'
