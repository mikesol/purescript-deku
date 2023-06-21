module Deku.DOM.Attr.TableValues where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data TableValues = TableValues

instance Attr Tags.FeFuncA_ TableValues String where
  pureAttr TableValues value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tableValues", value }
  mapAttr TableValues evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "tableValues", value: prop' value }

instance Attr Tags.FeFuncB_ TableValues String where
  pureAttr TableValues value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tableValues", value }
  mapAttr TableValues evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "tableValues", value: prop' value }

instance Attr Tags.FeFuncG_ TableValues String where
  pureAttr TableValues value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tableValues", value }
  mapAttr TableValues evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "tableValues", value: prop' value }

instance Attr Tags.FeFuncR_ TableValues String where
  pureAttr TableValues value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "tableValues", value }
  mapAttr TableValues evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "tableValues", value: prop' value }

instance Attr everything TableValues Unit where
  pureAttr TableValues _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "tableValues", value: unset' }
  mapAttr TableValues evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "tableValues", value: unset' }
