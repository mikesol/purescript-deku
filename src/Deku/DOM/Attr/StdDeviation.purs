module Deku.DOM.Attr.StdDeviation where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data StdDeviation = StdDeviation

instance Attr Tags.FeDropShadow_ StdDeviation String where
  pureAttr StdDeviation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stdDeviation", value }
  mapAttr StdDeviation evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stdDeviation", value: prop' value }

instance Attr Tags.FeGaussianBlur_ StdDeviation String where
  pureAttr StdDeviation value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "stdDeviation", value }
  mapAttr StdDeviation evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stdDeviation", value: prop' value }

instance Attr everything StdDeviation Unit where
  pureAttr StdDeviation _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "stdDeviation", value: unset' }
  mapAttr StdDeviation evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "stdDeviation", value: unset' }
