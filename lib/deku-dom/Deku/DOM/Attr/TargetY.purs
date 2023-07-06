module Deku.DOM.Attr.TargetY where

import Prelude

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TargetY = TargetY

instance Attr FeConvolveMatrix_ TargetY String where
  attr TargetY value = unsafeAttribute { key: "targetY", value: prop' value }

instance Attr everything TargetY Unit where
  attr TargetY _ = unsafeAttribute
    { key: "targetY", value: unset' }
