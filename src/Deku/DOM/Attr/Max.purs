module Deku.DOM.Attr.Max where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Max = Max

instance Attr Tags.Input_ Max String where
  pureAttr Max value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "max", value }

  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "max", value: prop' value }

instance Attr Tags.Meter_ Max String where
  pureAttr Max value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "max", value }

  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "max", value: prop' value }

instance Attr Tags.Progress_ Max String where
  pureAttr Max value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "max", value }

  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "max", value: prop' value }

instance Attr Tags.Animate_ Max String where
  pureAttr Max value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "max", value }

  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "max", value: prop' value }

instance Attr Tags.AnimateMotion_ Max String where
  pureAttr Max value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "max", value }

  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "max", value: prop' value }

instance Attr Tags.AnimateTransform_ Max String where
  pureAttr Max value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "max", value }

  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "max", value: prop' value }

instance Attr Tags.Set_ Max String where
  pureAttr Max value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "max", value }

  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "max", value: prop' value }

instance Attr everything Max Unit where
  pureAttr Max _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "max", value: unset' }
  mapAttr Max evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "max", value: unset' }
