module Deku.DOM.Attr.ColorInterpolationFilters where

import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit

data ColorInterpolationFilters = ColorInterpolationFilters

instance Deku.Attribute.Attr everything ColorInterpolationFilters Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "color-interpolation-filters", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr everything ColorInterpolationFilters String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "color-interpolation-filters", value: _ } <<<
    Deku.Attribute.prop'
