module Deku.DOM.Attr.Divisor where

import Prelude

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data Divisor = Divisor

instance Attr FeConvolveMatrix_ Divisor String where
  attr Divisor value = unsafeAttribute { key: "divisor", value: prop' value }

instance Attr everything Divisor Unit where
  attr Divisor _ = unsafeAttribute
    { key: "divisor", value: unset' }
