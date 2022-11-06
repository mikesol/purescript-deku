module Deku.DOM.Attr.Divisor where

import Deku.DOM.Elt.FeConvolveMatrix (FeConvolveMatrix_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Divisor = Divisor

instance Attr FeConvolveMatrix_ Divisor String where
  attr Divisor value = unsafeAttribute { key: "divisor", value: prop' value }