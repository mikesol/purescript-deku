module Deku.DOM.Attr.CalcMode where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data CalcMode = CalcMode

instance Attr Tags.Animate_ CalcMode String where
  pureAttr CalcMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "calcMode", value }

  mapAttr CalcMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "calcMode", value: prop' value }

instance Attr Tags.AnimateMotion_ CalcMode String where
  pureAttr CalcMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "calcMode", value }

  mapAttr CalcMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "calcMode", value: prop' value }

instance Attr Tags.AnimateTransform_ CalcMode String where
  pureAttr CalcMode value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "calcMode", value }

  mapAttr CalcMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "calcMode", value: prop' value }

instance Attr everything CalcMode Unit where
  pureAttr CalcMode _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "calcMode", value: unset' }
  mapAttr CalcMode evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "calcMode", value: unset' }
