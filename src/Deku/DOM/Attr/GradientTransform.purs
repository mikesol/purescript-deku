module Deku.DOM.Attr.GradientTransform where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data GradientTransform = GradientTransform

instance Attr LinearGradient_ GradientTransform String where
  attr GradientTransform value = unsafeAttribute { key: "gradientTransform", value: prop' value }
instance Attr RadialGradient_ GradientTransform String where
  attr GradientTransform value = unsafeAttribute { key: "gradientTransform", value: prop' value }