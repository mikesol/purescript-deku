module Deku.DOM.Attr.MarkerUnits where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MarkerUnits = MarkerUnits

instance Attr Tags.Marker_ MarkerUnits String where
  pureAttr MarkerUnits value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "markerUnits", value }
  mapAttr MarkerUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "markerUnits", value: prop' value }

instance Attr everything MarkerUnits Unit where
  pureAttr MarkerUnits _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "markerUnits", value: unset' }
  mapAttr MarkerUnits evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "markerUnits", value: unset' }
