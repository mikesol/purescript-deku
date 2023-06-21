module Deku.DOM.Attr.Begin where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Begin = Begin

instance Attr Tags.Animate_ Begin String where
  pureAttr Begin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "begin", value }

  mapAttr Begin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "begin", value: prop' value }

instance Attr Tags.AnimateMotion_ Begin String where
  pureAttr Begin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "begin", value }

  mapAttr Begin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "begin", value: prop' value }

instance Attr Tags.AnimateTransform_ Begin String where
  pureAttr Begin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "begin", value }

  mapAttr Begin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "begin", value: prop' value }

instance Attr Tags.Set_ Begin String where
  pureAttr Begin value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "begin", value }

  mapAttr Begin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "begin", value: prop' value }

instance Attr everything Begin Unit where
  pureAttr Begin _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "begin", value: unset' }
  mapAttr Begin evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "begin", value: unset' }
