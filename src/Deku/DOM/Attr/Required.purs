module Deku.DOM.Attr.Required where

import Prelude
import Data.Either (Either(..))

import Deku.Attribute (class Attr, prop', unsafeAttribute, unsafePureAttribute, unsafeVolatileAttribute, unset')
import Deku.DOM.Tags as Tags

data Required = Required

instance Attr Tags.Input_ Required String where
  pureAttr Required value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "required", value }

  mapAttr Required evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "required", value: prop' value }

instance Attr Tags.Select_ Required String where
  pureAttr Required value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "required", value }

  mapAttr Required evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "required", value: prop' value }

instance Attr Tags.Textarea_ Required String where
  pureAttr Required value = unsafeAttribute $ Left $ unsafePureAttribute
    { key: "required", value }

  mapAttr Required evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute { key: "required", value: prop' value }

instance Attr everything Required Unit where
  pureAttr Required _ = unsafeAttribute $ Right $ pure $ unsafeVolatileAttribute
    { key: "required", value: unset' }
  mapAttr Required evalue = unsafeAttribute $ Right $ evalue <#> \value ->
    unsafeVolatileAttribute
      { key: "required", value: unset' }
