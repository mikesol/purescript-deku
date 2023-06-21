module Deku.DOM.Attr.Scoped where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Scoped = Scoped

instance Attr Tags.Style_ Scoped String where
  pureAttr Scoped value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "scoped", value }

  mapAttr Scoped evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "scoped", value: prop' value }

instance Attr everything Scoped Unit where
  pureAttr Scoped _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "scoped", value: unset' }
  mapAttr Scoped evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "scoped", value: unset' }
