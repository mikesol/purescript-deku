module Deku.DOM.Attr.Size where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Size = Size

instance Attr Tags.Input_ Size String where
  pureAttr Size value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "size", value }

  mapAttr Size evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "size", value: prop' value }

instance Attr Tags.Select_ Size String where
  pureAttr Size value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "size", value }

  mapAttr Size evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "size", value: prop' value }

instance Attr everything Size Unit where
  pureAttr Size _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "size", value: unset' }
  mapAttr Size evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "size", value: unset' }
