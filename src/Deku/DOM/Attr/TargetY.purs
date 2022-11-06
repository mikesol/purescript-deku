module Deku.DOM.Attr.TargetY where

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data TargetY = TargetY

instance Attr FeConvolveMatrix_ TargetY String where
  attr TargetY value = unsafeAttribute { key: "targetY", value: prop' value }