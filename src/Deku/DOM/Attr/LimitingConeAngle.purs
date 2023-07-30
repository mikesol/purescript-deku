module Deku.DOM.Attr.LimitingConeAngle where

import Prelude
import Data.These (These(..))
import Data.Tuple (fst, snd)

import Deku.DOM.Elt.FeSpotLight (FeSpotLight_)
import Deku.Attribute (class Attr, prop', unsafeAttribute, unset')

data LimitingConeAngle = LimitingConeAngle

instance Attr FeSpotLight_ LimitingConeAngle String where
  attr LimitingConeAngle bothValues = unsafeAttribute $ Both
    { key: "limitingConeAngle", value: prop' (fst bothValues) }
    ( snd bothValues <#> \value ->
        { key: "limitingConeAngle", value: prop' value }
    )
  pureAttr LimitingConeAngle value = unsafeAttribute $ This
    { key: "limitingConeAngle", value: prop' value }
  unpureAttr LimitingConeAngle eventValue = unsafeAttribute $ That $ eventValue
    <#> \value -> { key: "limitingConeAngle", value: prop' value }

instance Attr everything LimitingConeAngle Unit where
  attr LimitingConeAngle bothValues = unsafeAttribute $ Both
    { key: "limitingConeAngle", value: unset' }
    (snd bothValues <#> \_ -> { key: "limitingConeAngle", value: unset' })
  pureAttr LimitingConeAngle _ = unsafeAttribute $ This
    { key: "limitingConeAngle", value: unset' }
  unpureAttr LimitingConeAngle eventValue = unsafeAttribute $ That $ eventValue
    <#> \_ -> { key: "limitingConeAngle", value: unset' }
