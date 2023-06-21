module Deku.DOM.Attr.Value where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Value = Value

instance Attr Tags.Textarea_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr Tags.Button_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr Tags.Input_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr Tags.Li_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr Tags.Meter_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr Tags.Option_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr Tags.Progress_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr Tags.Param_ Value String where
  pureAttr Value value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "value", value }

  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "evalue", value: prop' value }

instance Attr everything Value Unit where
  pureAttr Value _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "value", value: unset' }
  mapAttr Value evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "value", value: unset' }
