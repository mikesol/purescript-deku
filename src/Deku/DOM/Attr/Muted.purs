module Deku.DOM.Attr.Muted where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Muted = Muted

instance Attr Tags.Audio_ Muted String where
  pureAttr Muted value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "muted", value }

  mapAttr Muted evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "muted", value: prop' value }

instance Attr Tags.Video_ Muted String where
  pureAttr Muted value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "muted", value }

  mapAttr Muted evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "muted", value: prop' value }

instance Attr everything Muted Unit where
  pureAttr Muted _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "muted", value: unset' }
  mapAttr Muted evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "muted", value: unset' }
