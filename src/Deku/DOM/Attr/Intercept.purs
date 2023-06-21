module Deku.DOM.Attr.Intercept where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Intercept = Intercept

instance Attr Tags.FeFuncA_ Intercept String where
  pureAttr Intercept value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "intercept", value }
  mapAttr Intercept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "intercept", value: prop' value }

instance Attr Tags.FeFuncB_ Intercept String where
  pureAttr Intercept value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "intercept", value }
  mapAttr Intercept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "intercept", value: prop' value }

instance Attr Tags.FeFuncG_ Intercept String where
  pureAttr Intercept value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "intercept", value }
  mapAttr Intercept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "intercept", value: prop' value }

instance Attr Tags.FeFuncR_ Intercept String where
  pureAttr Intercept value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "intercept", value }
  mapAttr Intercept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "intercept", value: prop' value }

instance Attr everything Intercept Unit where
  pureAttr Intercept _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "intercept", value: unset' }
  mapAttr Intercept evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "intercept", value: unset' }
