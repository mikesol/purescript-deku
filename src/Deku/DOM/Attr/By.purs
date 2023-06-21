module Deku.DOM.Attr.By where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data By = By

instance Attr Tags.Animate_ By String where
  pureAttr By value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "by", value }

  mapAttr By evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "by", value: prop' value }

instance Attr Tags.AnimateMotion_ By String where
  pureAttr By value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "by", value }

  mapAttr By evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "by", value: prop' value }

instance Attr Tags.AnimateTransform_ By String where
  pureAttr By value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "by", value }

  mapAttr By evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "by", value: prop' value }

instance Attr everything By Unit where
  pureAttr By _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "by", value: unset' }
  mapAttr By evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "by", value: unset' }
