module Deku.DOM.Attr.Preload where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Preload = Preload

instance Attr Tags.Audio_ Preload String where
  pureAttr Preload value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "preload", value }

  mapAttr Preload evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "preload", value: prop' value }

instance Attr Tags.Video_ Preload String where
  pureAttr Preload value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "preload", value }

  mapAttr Preload evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "preload", value: prop' value }

instance Attr everything Preload Unit where
  pureAttr Preload _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "preload", value: unset' }
  mapAttr Preload evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "preload", value: unset' }
