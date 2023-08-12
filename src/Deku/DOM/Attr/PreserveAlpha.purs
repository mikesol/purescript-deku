module Deku.DOM.Attr.PreserveAlpha where

import Prelude

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data PreserveAlpha = PreserveAlpha

instance Attr FeConvolveMatrix_ PreserveAlpha String where
  attr PreserveAlpha value = unsafeAttribute
    { key: "preserveAlpha", value: prop' value }

instance Attr everything PreserveAlpha Unit where
  attr PreserveAlpha _ = unsafeAttribute
    { key: "preserveAlpha", value: unset' }
