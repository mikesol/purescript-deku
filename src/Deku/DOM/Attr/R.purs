module Deku.DOM.Attr.R where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data R = R

instance Attr Circle_ R String where
  attr R value = unsafeAttribute { key: "r", value: prop' value }
instance Attr RadialGradient_ R String where
  attr R value = unsafeAttribute { key: "r", value: prop' value }