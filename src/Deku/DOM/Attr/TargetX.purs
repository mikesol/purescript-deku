module Deku.DOM.Attr.TargetX where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TargetX = TargetX

instance Attr Tags.FeConvolveMatrix_ TargetX String where
  pureAttr TargetX value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "targetX", value }

  mapAttr TargetX evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "targetX", value: prop' value }

instance Attr everything TargetX Unit where
  pureAttr TargetX _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "targetX", value: unset' }
  mapAttr TargetX evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "targetX", value: unset' }
