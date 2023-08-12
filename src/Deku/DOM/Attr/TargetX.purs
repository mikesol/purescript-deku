module Deku.DOM.Attr.TargetX where

import Prelude

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data TargetX = TargetX

instance Attr FeConvolveMatrix_ TargetX String where
  attr TargetX value = unsafeAttribute { key: "targetX", value: prop' value }

instance Attr everything TargetX Unit where
  attr TargetX _ = unsafeAttribute
    { key: "targetX", value: unset' }
