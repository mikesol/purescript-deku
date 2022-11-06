module Deku.DOM.Attr.Bias where

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Bias = Bias

instance Attr FeConvolveMatrix_ Bias String where
  attr Bias value = unsafeAttribute { key: "bias", value: prop' value }