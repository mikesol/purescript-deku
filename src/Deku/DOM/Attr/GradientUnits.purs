module Deku.DOM.Attr.GradientUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data GradientUnits = GradientUnits

instance Attr Tags.LinearGradient_ GradientUnits String where
  pureAttr GradientUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "gradientUnits", value }
  mapAttr GradientUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "gradientUnits", value: prop' value }

instance Attr Tags.RadialGradient_ GradientUnits String where
  pureAttr GradientUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "gradientUnits", value }
  mapAttr GradientUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "gradientUnits", value: prop' value }

instance Attr everything GradientUnits Unit where
  pureAttr GradientUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "gradientUnits", value: unset' }
  mapAttr GradientUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "gradientUnits", value: unset' }
