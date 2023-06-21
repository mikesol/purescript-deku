module Deku.DOM.Attr.RepeatCount where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data RepeatCount = RepeatCount

instance Attr Tags.Animate_ RepeatCount String where
  pureAttr RepeatCount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatCount", value }
  mapAttr RepeatCount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatCount", value: prop' value }

instance Attr Tags.AnimateMotion_ RepeatCount String where
  pureAttr RepeatCount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatCount", value }
  mapAttr RepeatCount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatCount", value: prop' value }

instance Attr Tags.AnimateTransform_ RepeatCount String where
  pureAttr RepeatCount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatCount", value }
  mapAttr RepeatCount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatCount", value: prop' value }

instance Attr Tags.Set_ RepeatCount String where
  pureAttr RepeatCount value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatCount", value }
  mapAttr RepeatCount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatCount", value: prop' value }

instance Attr everything RepeatCount Unit where
  pureAttr RepeatCount _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "repeatCount", value: unset' }
  mapAttr RepeatCount evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatCount", value: unset' }
