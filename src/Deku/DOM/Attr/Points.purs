module Deku.DOM.Attr.Points where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Points = Points

instance Attr Tags.Polygon_ Points String where
  pureAttr Points value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "points", value }

  mapAttr Points evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "points", value: prop' value }

instance Attr Tags.Polyline_ Points String where
  pureAttr Points value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "points", value }

  mapAttr Points evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "points", value: prop' value }

instance Attr everything Points Unit where
  pureAttr Points _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "points", value: unset' }
  mapAttr Points evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "points", value: unset' }
