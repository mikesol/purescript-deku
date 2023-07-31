module Deku.DOM.Attr.GradientUnits where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Prim hiding (Char, Type)
import Deku.DOM.Elt.LinearGradient (LinearGradient_)
import Deku.DOM.Elt.RadialGradient (RadialGradient_)

data GradientUnits = GradientUnits

instance Deku.Attribute.Attr everything GradientUnits Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute { key: "gradientUnits", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr LinearGradient_ GradientUnits String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "gradientUnits", value: _ } <<<
    Deku.Attribute.prop'

instance Deku.Attribute.Attr RadialGradient_ GradientUnits String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "gradientUnits", value: _ } <<<
    Deku.Attribute.prop'
