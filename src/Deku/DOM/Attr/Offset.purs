module Deku.DOM.Attr.Offset where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Offset = Offset

instance Attr Tags.FeFuncA_ Offset String where
  pureAttr Offset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "offset", value }

  mapAttr Offset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "offset", value: prop' value }

instance Attr Tags.FeFuncB_ Offset String where
  pureAttr Offset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "offset", value }

  mapAttr Offset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "offset", value: prop' value }

instance Attr Tags.FeFuncG_ Offset String where
  pureAttr Offset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "offset", value }

  mapAttr Offset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "offset", value: prop' value }

instance Attr Tags.FeFuncR_ Offset String where
  pureAttr Offset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "offset", value }

  mapAttr Offset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "offset", value: prop' value }

instance Attr Tags.Stop_ Offset String where
  pureAttr Offset value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "offset", value }

  mapAttr Offset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "offset", value: prop' value }

instance Attr everything Offset Unit where
  pureAttr Offset _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "offset", value: unset' }
  mapAttr Offset evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "offset", value: unset' }
