module Deku.DOM.Attr.PointsAtY where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data PointsAtY = PointsAtY

instance Attr Tags.FeSpotLight_ PointsAtY String where
  pureAttr PointsAtY value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "pointsAtY", value }
  mapAttr PointsAtY evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointsAtY", value: prop' value }

instance Attr everything PointsAtY Unit where
  pureAttr PointsAtY _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "pointsAtY", value: unset' }
  mapAttr PointsAtY evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "pointsAtY", value: unset' }
