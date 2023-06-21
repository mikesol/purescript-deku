module Deku.DOM.Attr.Min where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Min = Min

instance Attr Tags.Input_ Min String where
  pureAttr Min value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "min", value }

  mapAttr Min evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "min", value: prop' value }

instance Attr Tags.Meter_ Min String where
  pureAttr Min value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "min", value }

  mapAttr Min evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "min", value: prop' value }

instance Attr Tags.Animate_ Min String where
  pureAttr Min value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "min", value }

  mapAttr Min evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "min", value: prop' value }

instance Attr Tags.AnimateMotion_ Min String where
  pureAttr Min value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "min", value }

  mapAttr Min evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "min", value: prop' value }

instance Attr Tags.AnimateTransform_ Min String where
  pureAttr Min value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "min", value }

  mapAttr Min evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "min", value: prop' value }

instance Attr Tags.Set_ Min String where
  pureAttr Min value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "min", value }

  mapAttr Min evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "min", value: prop' value }

instance Attr everything Min Unit where
  pureAttr Min _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "min", value: unset' }
  mapAttr Min evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "min", value: unset' }
