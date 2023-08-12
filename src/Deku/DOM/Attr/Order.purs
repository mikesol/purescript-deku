module Deku.DOM.Attr.Order where

import Prelude

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Order = Order

instance Attr FeConvolveMatrix_ Order String where
  attr Order value = unsafeAttribute { key: "order", value: prop' value }

instance Attr everything Order Unit where
  attr Order _ = unsafeAttribute
    { key: "order", value: unset' }
