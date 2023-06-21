module Deku.DOM.Attr.Slope where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Slope = Slope

instance Attr Tags.FeFuncA_ Slope String where
  pureAttr Slope value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slope", value }

  mapAttr Slope evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slope", value: prop' value }

instance Attr Tags.FeFuncB_ Slope String where
  pureAttr Slope value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slope", value }

  mapAttr Slope evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slope", value: prop' value }

instance Attr Tags.FeFuncG_ Slope String where
  pureAttr Slope value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slope", value }

  mapAttr Slope evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slope", value: prop' value }

instance Attr Tags.FeFuncR_ Slope String where
  pureAttr Slope value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "slope", value }

  mapAttr Slope evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "slope", value: prop' value }

instance Attr everything Slope Unit where
  pureAttr Slope _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "slope", value: unset' }
  mapAttr Slope evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "slope", value: unset' }
