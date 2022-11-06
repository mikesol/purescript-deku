module Deku.DOM.Attr.TargetX where

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data TargetX = TargetX

instance Attr FeConvolveMatrix_ TargetX String where
  attr TargetX value = unsafeAttribute { key: "targetX", value: prop' value }