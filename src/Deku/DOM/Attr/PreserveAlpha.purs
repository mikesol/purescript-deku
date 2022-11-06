module Deku.DOM.Attr.PreserveAlpha where

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data PreserveAlpha = PreserveAlpha

instance Attr FeConvolveMatrix_ PreserveAlpha String where
  attr PreserveAlpha value = unsafeAttribute
    { key: "preserveAlpha", value: prop' value }