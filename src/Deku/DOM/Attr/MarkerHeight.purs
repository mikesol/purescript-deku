module Deku.DOM.Attr.MarkerHeight where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data MarkerHeight = MarkerHeight

instance Attr Tags.Marker_ MarkerHeight String where
  pureAttr MarkerHeight value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "markerHeight", value }
  mapAttr MarkerHeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "markerHeight", value: prop' value }

instance Attr everything MarkerHeight Unit where
  pureAttr MarkerHeight _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "markerHeight", value: unset' }
  mapAttr MarkerHeight evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "markerHeight", value: unset' }
