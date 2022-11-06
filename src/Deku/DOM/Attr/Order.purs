module Deku.DOM.Attr.Order where

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Order = Order

instance Attr FeConvolveMatrix_ Order String where
  attr Order value = unsafeAttribute { key: "order", value: prop' value }