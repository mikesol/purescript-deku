module Deku.DOM.Attr.TargetY where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TargetY = TargetY

instance Attr Tags.FeConvolveMatrix_ TargetY String where
  pureAttr TargetY value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "targetY", value }

  mapAttr TargetY evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "targetY", value: prop' value }

instance Attr everything TargetY Unit where
  pureAttr TargetY _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "targetY", value: unset' }
  mapAttr TargetY evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "targetY", value: unset' }
