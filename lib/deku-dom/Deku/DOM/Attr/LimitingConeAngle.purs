module Deku.DOM.Attr.LimitingConeAngle where

import Prelude

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LimitingConeAngle = LimitingConeAngle

instance Attr FeSpotLight_ LimitingConeAngle String where
  attr LimitingConeAngle value = unsafeAttribute
    { key: "limitingConeAngle", value: prop' value }

instance Attr everything LimitingConeAngle Unit where
  attr LimitingConeAngle _ = unsafeAttribute
    { key: "limitingConeAngle", value: unset' }
