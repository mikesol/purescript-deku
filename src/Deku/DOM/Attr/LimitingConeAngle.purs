module Deku.DOM.Attr.LimitingConeAngle where

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data LimitingConeAngle = LimitingConeAngle

instance Attr FeSpotLight_ LimitingConeAngle String where
  attr LimitingConeAngle value = unsafeAttribute
    { key: "limitingConeAngle", value: prop' value }