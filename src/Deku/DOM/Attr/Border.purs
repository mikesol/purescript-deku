module Deku.DOM.Attr.Border where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Border = Border

instance Attr Tags.Img_ Border String where
  pureAttr Border value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "border", value }

  mapAttr Border evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "border", value: prop' value }

instance Attr Tags.Object_ Border String where
  pureAttr Border value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "border", value }

  mapAttr Border evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "border", value: prop' value }

instance Attr Tags.Table_ Border String where
  pureAttr Border value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "border", value }

  mapAttr Border evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "border", value: prop' value }

instance Attr everything Border Unit where
  pureAttr Border _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "border", value: unset' }
  mapAttr Border evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "border", value: unset' }
