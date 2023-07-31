module Deku.DOM.Attr.ColorInterpolation where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data ColorInterpolation = ColorInterpolation

instance Deku.Attribute.Attr everything ColorInterpolation Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "color-interpolation", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything ColorInterpolation String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "color-interpolation", value: _ } <<<
    Deku.Attribute.prop'
