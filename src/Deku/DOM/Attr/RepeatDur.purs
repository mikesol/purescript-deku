module Deku.DOM.Attr.RepeatDur where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data RepeatDur = RepeatDur

instance Attr Tags.Animate_ RepeatDur String where
  pureAttr RepeatDur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatDur", value }
  mapAttr RepeatDur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatDur", value: prop' value }

instance Attr Tags.AnimateMotion_ RepeatDur String where
  pureAttr RepeatDur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatDur", value }
  mapAttr RepeatDur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatDur", value: prop' value }

instance Attr Tags.AnimateTransform_ RepeatDur String where
  pureAttr RepeatDur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatDur", value }
  mapAttr RepeatDur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatDur", value: prop' value }

instance Attr Tags.Set_ RepeatDur String where
  pureAttr RepeatDur value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "repeatDur", value }
  mapAttr RepeatDur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatDur", value: prop' value }

instance Attr everything RepeatDur Unit where
  pureAttr RepeatDur _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "repeatDur", value: unset' }
  mapAttr RepeatDur evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "repeatDur", value: unset' }
