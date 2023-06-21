module Deku.DOM.Attr.PointsAtX where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PointsAtX = PointsAtX

instance Attr Tags.FeSpotLight_ PointsAtX String where
  pureAttr PointsAtX value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointsAtX", value }
  mapAttr PointsAtX evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointsAtX", value: prop' value }

instance Attr everything PointsAtX Unit where
  pureAttr PointsAtX _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointsAtX", value: unset' }
  mapAttr PointsAtX evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointsAtX", value: unset' }
