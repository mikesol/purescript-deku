module Deku.DOM.Attr.LimitingConeAngle where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data LimitingConeAngle = LimitingConeAngle

instance Attr Tags.FeSpotLight_ LimitingConeAngle String where
  pureAttr LimitingConeAngle value = unsafeAttribute $ Left $
    unsafePureAttribute
      { key: "limitingConeAngle", value }
  mapAttr LimitingConeAngle evalue = unsafeAttribute $ Right $ evalue <#>
    \value -> unsafeVolatileAttribute
      { key: "limitingConeAngle", value: prop' value }

instance Attr everything LimitingConeAngle Unit where
  pureAttr LimitingConeAngle _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "limitingConeAngle", value: unset' }
  mapAttr LimitingConeAngle evalue = unsafeAttribute $ Right $ evalue <#>
    \value ->
      unsafeVolatileAttribute
        { key: "limitingConeAngle", value: unset' }
