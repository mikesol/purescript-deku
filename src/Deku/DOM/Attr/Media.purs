module Deku.DOM.Attr.Media where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Media = Media

instance Attr Tags.A_ Media String where
  pureAttr Media value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "media", value }

  mapAttr Media evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "media", value: prop' value }

instance Attr Tags.Area_ Media String where
  pureAttr Media value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "media", value }

  mapAttr Media evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "media", value: prop' value }

instance Attr Tags.Link_ Media String where
  pureAttr Media value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "media", value }

  mapAttr Media evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "media", value: prop' value }

instance Attr Tags.Source_ Media String where
  pureAttr Media value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "media", value }

  mapAttr Media evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "media", value: prop' value }

instance Attr Tags.Style_ Media String where
  pureAttr Media value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "media", value }

  mapAttr Media evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "media", value: prop' value }

instance Attr everything Media Unit where
  pureAttr Media _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "media", value: unset' }
  mapAttr Media evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "media", value: unset' }
