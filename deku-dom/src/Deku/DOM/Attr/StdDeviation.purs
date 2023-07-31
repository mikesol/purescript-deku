module Deku.DOM.Attr.StdDeviation where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)

data StdDeviation = StdDeviation

instance Deku.Attribute.Attr everything StdDeviation Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "stdDeviation", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeDropShadow_ StdDeviation String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stdDeviation", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr FeGaussianBlur_ StdDeviation String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "stdDeviation", value: _ } <<<
    Deku.Attribute.prop'
