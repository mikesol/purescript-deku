module Deku.DOM.Attr.AttributeType where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data AttributeType = AttributeType

instance Attr Tags.AnimateTransform_ AttributeType String where
  pureAttr AttributeType value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "attributeType", value }
  mapAttr AttributeType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "attributeType", value: prop' value }

instance Attr everything AttributeType Unit where
  pureAttr AttributeType _ = unsafeAttribute $ Right $ pure $
    unsafeVolatileAttribute
      { key: "attributeType", value: unset' }
  mapAttr AttributeType evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "attributeType", value: unset' }
