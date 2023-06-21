module Deku.DOM.Attr.AttributeName where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AttributeName = AttributeName

instance Attr Tags.Animate_ AttributeName String where
  pureAttr AttributeName value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "attributeName", value }
  mapAttr AttributeName evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "attributeName", value: prop' value }

instance Attr Tags.AnimateMotion_ AttributeName String where
  pureAttr AttributeName value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "attributeName", value }
  mapAttr AttributeName evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "attributeName", value: prop' value }

instance Attr Tags.AnimateTransform_ AttributeName String where
  pureAttr AttributeName value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "attributeName", value }
  mapAttr AttributeName evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "attributeName", value: prop' value }

instance Attr Tags.Set_ AttributeName String where
  pureAttr AttributeName value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "attributeName", value }
  mapAttr AttributeName evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "attributeName", value: prop' value }

instance Attr everything AttributeName Unit where
  pureAttr AttributeName _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "attributeName", value: unset' }
  mapAttr AttributeName evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "attributeName", value: unset' }
