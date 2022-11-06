module Deku.DOM.Attr.GradientUnits where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data GradientUnits = GradientUnits

instance Attr LinearGradient_ GradientUnits String where
  attr GradientUnits value = unsafeAttribute { key: "gradientUnits", value: prop' value }
instance Attr RadialGradient_ GradientUnits String where
  attr GradientUnits value = unsafeAttribute { key: "gradientUnits", value: prop' value }