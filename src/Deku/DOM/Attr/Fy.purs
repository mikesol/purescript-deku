module Deku.DOM.Attr.Fy where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Fy = Fy

instance Attr RadialGradient_ Fy String where
  attr Fy value = unsafeAttribute { key: "fy", value: prop' value }