module Deku.DOM.Attr.LimitingConeAngle where

import Deku.Attribute as Deku.Attribute
import Data.Unit as Data.Unit
import Control.Semigroupoid ((<<<))
import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)

data LimitingConeAngle = LimitingConeAngle

instance Deku.Attribute.Attr everything LimitingConeAngle Data.Unit.Unit where
  attr _ _ = Deku.Attribute.unsafeAttribute
    { key: "limitingConeAngle", value: Deku.Attribute.unset' }

instance Deku.Attribute.Attr FeSpotLight_ LimitingConeAngle String where
  attr _ = Deku.Attribute.unsafeAttribute <<< { key: "limitingConeAngle", value: _ } <<<
    Deku.Attribute.prop'
