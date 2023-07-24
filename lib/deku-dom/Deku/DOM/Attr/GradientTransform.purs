module Deku.DOM.Attr.GradientTransform where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)

data GradientTransform = GradientTransform

instance Deku.Attribute.Attr everything GradientTransform Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "gradientTransform", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr LinearGradient_ GradientTransform String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "gradientTransform", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ GradientTransform String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "gradientTransform", value: _ } <<<
    Deku.Attribute.prop'
