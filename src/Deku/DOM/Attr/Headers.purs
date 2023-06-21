module Deku.DOM.Attr.Headers where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Headers = Headers

instance Attr Tags.Td_ Headers String where
  pureAttr Headers value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "headers", value }

  mapAttr Headers evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "headers", value: prop' value }

instance Attr Tags.Th_ Headers String where
  pureAttr Headers value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "headers", value }

  mapAttr Headers evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "headers", value: prop' value }

instance Attr everything Headers Unit where
  pureAttr Headers _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "headers", value: unset' }
  mapAttr Headers evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "headers", value: unset' }
