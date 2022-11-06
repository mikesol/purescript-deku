module Deku.DOM.Attr.StdDeviation where

import Deku.DOM.Elt.FeGaussianBlur (FeGaussianBlur_)
import Deku.DOM.Elt.FeDropShadow (FeDropShadow_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data StdDeviation = StdDeviation

instance Attr FeDropShadow_ StdDeviation String where
  attr StdDeviation value = unsafeAttribute
    { key: "stdDeviation", value: prop' value }

instance Attr FeGaussianBlur_ StdDeviation String where
  attr StdDeviation value = unsafeAttribute
    { key: "stdDeviation", value: prop' value }