module Deku.DOM.Attr.Buffered where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Buffered = Buffered

instance Attr Tags.Audio_ Buffered String where
  pureAttr Buffered value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "buffered", value }

  mapAttr Buffered evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "buffered", value: prop' value }

instance Attr Tags.Video_ Buffered String where
  pureAttr Buffered value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "buffered", value }

  mapAttr Buffered evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "buffered", value: prop' value }

instance Attr everything Buffered Unit where
  pureAttr Buffered _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "buffered", value: unset' }
  mapAttr Buffered evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "buffered", value: unset' }
