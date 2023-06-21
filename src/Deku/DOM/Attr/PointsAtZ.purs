module Deku.DOM.Attr.PointsAtZ where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PointsAtZ = PointsAtZ

instance Attr Tags.FeSpotLight_ PointsAtZ String where
  pureAttr PointsAtZ value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointsAtZ", value }
  mapAttr PointsAtZ evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointsAtZ", value: prop' value }

instance Attr everything PointsAtZ Unit where
  pureAttr PointsAtZ _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointsAtZ", value: unset' }
  mapAttr PointsAtZ evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointsAtZ", value: unset' }
