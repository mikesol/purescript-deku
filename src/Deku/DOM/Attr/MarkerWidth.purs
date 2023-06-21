module Deku.DOM.Attr.MarkerWidth where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MarkerWidth = MarkerWidth

instance Attr Tags.Marker_ MarkerWidth String where
  pureAttr MarkerWidth value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "markerWidth", value }
  mapAttr MarkerWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "markerWidth", value: prop' value }

instance Attr everything MarkerWidth Unit where
  pureAttr MarkerWidth _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "markerWidth", value: unset' }
  mapAttr MarkerWidth evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "markerWidth", value: unset' }
