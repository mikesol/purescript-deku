module Deku.DOM.Attr.StrokeImage where

import Control.Semigroupoid ((<<<))
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data StrokeImage = StrokeImage

instance Deku.Attribute.Attr everything StrokeImage Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stroke-image", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything StrokeImage String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stroke-image", value: _ } <<<
    Deku.Attribute.prop'
