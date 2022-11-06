module Deku.DOM.Attr.Fr where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Fr = Fr

instance Attr RadialGradient_ Fr String where
  attr Fr value = unsafeAttribute { key: "fr", value: prop' value }