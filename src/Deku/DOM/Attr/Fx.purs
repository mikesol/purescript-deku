module Deku.DOM.Attr.Fx where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Fx = Fx

instance Attr RadialGradient_ Fx String where
  attr Fx value = unsafeAttribute { key: "fx", value: prop' value }