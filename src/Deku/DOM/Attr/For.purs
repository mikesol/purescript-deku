module Deku.DOM.Attr.For where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data For = For

instance Attr Tags.Label_ For String where
  pureAttr For value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "for", value }

  mapAttr For evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "for", value: prop' value }

instance Attr Tags.Output_ For String where
  pureAttr For value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "for", value }

  mapAttr For evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "for", value: prop' value }

instance Attr everything For Unit where
  pureAttr For _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "for", value: unset' }
  mapAttr For evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "for", value: unset' }
